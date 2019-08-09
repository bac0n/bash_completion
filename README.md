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
my@box:/tmp$ x='a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/v/w/x/y/z'; mkdir -p $x; cd $x
my@box:/tmp/a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/v/w/x/y/z$ cd ...........................
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
