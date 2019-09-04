for file in ~/.zshrc.d/*.zshrc;
do
echo sourcing $file
source "$file"
done
