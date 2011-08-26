class RecursiveReplace
  INDENTATION = "  "
  COLOR_SUCCESS = "green"
  def self.go(original, replacement, path)
    original = Regexp.escape(replacement) # escape any special characters
    replacement = Regexp.escape(replacement)
   
    #exec("find ./ -type f | xargs sed -i 's/#{@string1}/#{@string2}/g'")
    files = files(path)
    puts files.inspect
    for file in files
      puts "success".green + INDENTATION + print_path(file)
      #exec("sed -i 's/#{original}/#{replacement}/g' #{file}") unless File.directory?(file)
    end
  end
  
  def self.print_path(path) # print pretty path
    indent = String.new
    path.split(File::SEPARATOR).each do 
      indent << RecursiveReplace::INDENTATION unless File.dirname(path) == "."
    end
    return File.directory?(path) ? path : indent + File.basename(path) 
  end
  
  def self.files(path) # get the working directory to start in
    path.nil? ? Dir.glob(File.join("**", "*")) : Dir.glob(File.join(File.dirname(path), "**", "*"))    
  end
  
end