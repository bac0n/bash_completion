# Expand dots to dot-dot component.

### Example
```bash
my@box:/usr/local/bin$ cd ...
my@box:/usr$
```
```bash
my@box:/usr/local/bin$ mkdir ...
my@box:/usr/local/bin$ cd .../..../
my@box:/usr$ 
```
```bash
my@box:/etc$ cd /usr/local/bin/.../bin/.../bin
my@box:/bin$
```
```bash
my@box:/tmp$ x='0/1/2/3/4/5/6/7/8/9'; mkdir -p $x; cd $x
my@box:/tmp/0/1/2/3/4/5/6/7/8/9$ cd ...........
my@box:/tmp$
```
```bash
my@box:/usr/local/bin$ cd ...<tab>
my@box:/usr/local/bin$ cd ../../
```
```bash
my@box:/usr/local/bin$ mkdir ...
my@box:/usr/local/bin$ cd .../..../<tab>
my@box:/usr/local/bin$ cd .../../../../
```
```bash
my@box:/etc$ cd /usr/local/bin/.../bin/.../bin<tab>
my@box:/etc$ cd /usr/local/bin/../../bin/../../bin/
```
