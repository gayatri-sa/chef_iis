# InSpec test for recipe iis::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  #describe user('root'), :skip do
  describe user('root') do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
#describe port(80), :skip do
describe port(80) do
  #it { should_not be_listening }
  it { should be_listening }
end
