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
