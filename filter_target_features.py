for line in open('raw_target_features.txt').readlines():
  if 'Features' in line:
    continue
  if 'Code-gen' in line:
    break
  items = line.lstrip().split(' ')
  if len(items) > 0:
    print(items[0])
