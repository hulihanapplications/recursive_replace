require "spec_helper"

describe RecursiveReplace do 
  describe "go" do
    before(:each) do
      # create test dir
      @test_dir_fixture = File.expand_path("../../fixtures/test", __FILE__)
      @test_dir = File.expand_path("../../tmp/#{File.basename(@test_dir_fixture)}", __FILE__)
      #puts "#{@test_dir_fixture} -> #{@test_dir}"
      FileUtils.cp_r(@test_dir_fixture, @test_dir)
    end
    
    after(:each) do
      # delete test dir
      FileUtils.rm_rf @test_dir
      raise "test dir should have been deleted" if File.exists?(@test_dir)
    end
    
    it "creates test directory properly" do 
      test_exists = File.exists?(@test_dir) && File.directory?(@test_dir)
      test_exists.should == true
    end
    
    it "replaces good with bad in test/good" do 
      path = File.join(@test_dir, "good") 
      File.read(path).should == "good"           
      described_class.replace("good", "bad", :path => path)
      File.read(path).should == "bad"
    end
    
    describe "erb" do 
      it "should replace erb code fine" do 
        original = "<%= print @object[:symbol] %>"
        replacement = "<%= puts @new_object[:new_symbol] %>"        
        path = File.join(@test_dir, "syntax", "file.erb")
        File.read(path).should == original
        described_class.replace(original, replacement, :path => path)
        File.read(path).should == replacement       
      end
    end
    
    context "console" do
      
    end    
  end
end
