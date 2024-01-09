import os
import argparse
import csv
from pathlib import Path
from tensorboard.backend.event_processing.event_accumulator import EventAccumulator
import tensorflow as tf

def def_args():
    parser = argparse.ArgumentParser(description='Extracter for tensorboard logs')
    
    parser.add_argument('--log_dir', type=str, default=None, help='src log path', required=True)
    parser.add_argument('--dst_dir', type=str, default=None, help='dst log path', required=True)
    
    args = parser.parse_args()
    return args

def extract_data_to_csv(tfevents_file, name, dst_dir):
    # Create csv file
    csv_name = name + '.csv'
    csv_path = os.path.join(dst_dir, csv_name)
    

    print(f"Extracting data from {tfevents_file} to {csv_path}")
    
    Path(csv_path).touch()
    
    # Extracting and writing the data
    with open(csv_path, 'w', newline='') as csvfile:
        csvwriter = csv.writer(csvfile)
        event_acc = EventAccumulator(tfevents_file)
        event_acc.Reload()
        tags = event_acc.Tags()['scalars']
        tags = ['step'] + tags
        
        
        data = [[] for i in range(len(tags))]
        
        for i in range(len(tags)):
            data[i].append(tags[i])
        
        for e in tf.compat.v1.train.summary_iterator(tfevents_file):
            datapoint = e.summary.value
            for i in range(len(datapoint)):
                tag=datapoint[i].tag
                value=datapoint[i].simple_value
                
                #find the index of the tag in the tags list
                index = tags.index(tag)
                #add the value to the correct collum
                data[index].append(value)
        
        old = 0
        for e in tf.compat.v1.train.summary_iterator(tfevents_file):
            step = e.step
            if step != old:
                index = tags.index('step')
                data[index].append(step)
                old = step
        
        last_collum = []
        for i in range(0, len(data)):
            #append the last ellement in each row to the last_collum list
            #some will be patted with their own last element even though they are empty
            last_collum.append(data[i][-1])
        
        data = zip(*data)
        csvwriter.writerows(data)
        csvwriter.writerow(last_collum)
        #close the file
        csvfile.close()
        
    print(f"Data extracted to {csv_path}")


if __name__=='__main__':
    args = def_args()
    
    #make sure dst_dir exists
    if not os.path.exists(args.dst_dir):
        os.makedirs(args.dst_dir)
    
    #loop through all folders in log_dir
    for subdir, dirs, files in os.walk(args.log_dir):
        dir_name = os.path.basename(subdir)
        for file in files: #only one should exist
            # print(os.path.join(subdir, file))
            extract_data_to_csv(os.path.join(subdir, file), dir_name, args.dst_dir)
            # exit()
        
    
    

