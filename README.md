# move-tutorial
some simple move modules for learning purposes

# Install rust 
https://www.rust-lang.org/tools/install

# Clone the move repo and install 
If on windows use WSL make sure you are inside WSL before you clone the repo otherwise you won't be able to install, and if not just run the following line by line in bash:
```
git clone https://github.com/move-language/move.git
cd move
./scripts/dev_setup.sh -ypt
source ~/.profile
cargo install --locked --path language/tools/move-cli
```
The locked in cargo install is to avoid an issue of rust latest version mismatching with the version used by move.

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
