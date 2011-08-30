require "rubygems" # ruby1.9 doesn't "require" it though
require "colored"
require "thor"
require File.expand_path(File.join("..", "recursive_replace_support"), __FILE__)

class RecursiveReplace < Thor
  include ::RecursiveReplaceSupport
  method_options :dry_run => false, :aliases => "-d"
  default_task :replace 
  
  desc "replace", "Replace first string with second string. Path is optional"
  #argument :original
  #argument :replacement
  #argument :path, :default => nil  
  def replace(original, replacement, path)
    if origin.nil? || replacement.nil? #ARGV.length < 2
      puts "Usage: recursive_replace [original] [replacement] [file or dir]"
      #exit 0 
    end    
    
    puts "Replacing #{original} with #{replacement} in #{path.nil? ? Dir.pwd : path}"
        
  end    
end
