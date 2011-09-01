require "rubygems" # ruby1.9 doesn't "require" it though
require "colored"
require "thor"
require File.expand_path(File.join("..", "recursive_replace_support"), __FILE__)

class RecursiveReplace < Thor
  include ::RecursiveReplaceSupport
  class_option :verbose, :desc => "verbose", :type => :boolean, :default => true


  class_option :user, :type => :string, :desc => "User to apply changes to.", :banner => "USERNAME", :required => false, :aliases => "-u" # required string option
  method_option :dry_run, :type => :boolean, :desc => "See what would be replaced.", :default => false, :aliases => "-d"
  map "-v" => :version
  map "--version" => :version

  
  default_task :version 
  
  desc "replace original replacement [path]", "Replace first string with second string. Path is optional"   
  def replace(original, replacement, path = ".")    
    puts "Replacing #{original} with #{replacement} in #{path.nil? ? Dir.pwd : path}"        
  end
  
  desc "version", "get the current version"
  def version
    puts options[:user] if options[:user]
     puts File.read(File.expand_path(File.join("..", "..", "VERSION"), __FILE__))
  end    
end
