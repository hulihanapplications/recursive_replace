# recursive_replace 

A ruby gem for recursively replacing text in multiple files and directories. Escapes special character, so you can replace special programming characters & syntax.

## Installation

```bash
gem install recursive_replace
```

## Usage

### Regular Text

```bash
echo "bad bad good" > test
recursive_replace bad good # replaced bad with good
cat test # => good good good
rm test
```

### Ruby

```bash
echo "<%= @object[:bad] %>" > test
recursive_replace <%= @object[:bad] %> <%= @new_object[:good] %>
cat test # => good good good
rm test
```
