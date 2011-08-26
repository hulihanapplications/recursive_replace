require "colored"

class RecursiveReplace
  INDENTATION = "  "  
  
  def self.replace(original, replacement, options = {}) # replace text in either a directory(recursively) or single file   
    #exec("find ./ -type f | xargs sed -i 's/#{@string1}/#{@string2}/g'")
    
    #puts files.inspect
    if options[:path].nil? || File.directory?(options[:path])  # recursively inside directory
      for file in files_inside(options[:path])
        options[:path] = file
        replace_in_file(original, replacement, options) unless File.directory?(file)
      end
    else # single file
      replace_in_file(original, replacement, options)
    end 
  end 
  
  def self.replace_in_file(original, replacement, options = {}) # do the actual replacing in a single file
    raise ScriptError, "options[:path] not defined" if options[:path].nil? 
    raise LoadError, "#{options[:path]} not found" unless File.exists?(options[:path])
    raise LoadError, "#{options[:path]} is a directory" if File.directory?(options[:path])
    
    # Set Defaults
    options[:verbose] = false if options[:verbose].nil?
    
    original = Regexp.escape(original) # escape any special characters
    replacement = Regexp.escape(replacement)
    
    results = system("sed -i 's/#{original}/#{replacement}/g' #{options[:path]}") 
    puts "success".green + "\t" + INDENTATION + print_path(options[:path]) if !File.directory?(options[:path]) && options[:verbose]
    #puts results.inspect
  end
  
  def self.print_path_with_indent(path) # print pretty path
    indent = String.new
    path.split(File::SEPARATOR).each do 
      indent << RecursiveReplace::INDENTATION unless File.dirname(path) == "."
    end
    return File.directory?(path) ? path : indent + File.basename(path) 
  end
  
  def self.print_path(path)
    path
  end
  
  def self.files_inside(path) # get the working directory to start in
    path.nil? ? Dir.glob(File.join("**", "*")) : Dir.glob(File.join(File.dirname(path), "**", "*"))    
  end
  
end