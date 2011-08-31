require "rubygems" # ruby1.9 doesn't "require" it though
require "colored"
require "thor"
require File.expand_path(File.join("..", "recursive_replace_support"), __FILE__)

class RecursiveReplace < Thor
  include ::RecursiveReplaceSupport
  
  #method_options :dry_run => false, :aliases => "-d"
  method_options :verbose => true
  map "-v" => :version
  map "--version" => :version

  
  default_task :replace 
  
  #argument :original, :required => true
  #argument :replacement, :required => true 
  #argument :original, :required => true, :for => :replace  
  #argument :replacement, :required => true, :for => :replace
  #argument :path, :optional => true, :for => :replace

  desc "replace", "Replace first string with second string. Path is optional"   
  def replace(original, replacement, path)
    if original.nil? || replacement.nil? #ARGV.length < 2
      puts "Usage: recursive_replace [original] [replacement] [file or dir]"
      exit 0 
    end    
    
    puts "Replacing #{original} with #{replacement} in #{path.nil? ? Dir.pwd : path}"
        
  end
  
  #argument :cheese, :for => :version 
  desc "version", "get the current version"
  def version
     puts File.read(File.expand_path(File.join("..", "..", "VERSION"), __FILE__))
  end    
end
