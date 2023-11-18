# move-tutorial
some simple move modules for learning purposes

# Install rust 
https://www.rust-lang.org/tools/install

# Clone the move repo and install 
```
git clone https://github.com/move-language/move.git
cd move
./scripts/dev_setup.sh -ypt
source ~/.profile
cargo install --lock --path language/tools/move-cli
```
The lock in cargo install is to avoid an issue of rust latest version mismatching with the version used by move.

# Test your installation:
```
move --help
```
# To test the tutorials:
cd into in one of the move tutorial folders and run:
```
move build
move test 
```
