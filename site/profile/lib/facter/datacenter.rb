Facter.add('datacenter') do
  setcode do
    hostname = Facter.value(:hostname)
  
    if hostname =~ /^lon/
      answer = "London"
    elsif hostname =~ /^pdx/
      answer = "Portland"
    elsif hostname =~ /^nyc/
      answer = "NewYork"
    end
  end
end