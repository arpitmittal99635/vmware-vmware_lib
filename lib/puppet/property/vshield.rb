require 'puppet_x/vmware/util'

class Vshield < Puppet::Property

  def camel_munge(value, uppercase = false)
    case value
    when Hash
      value.each do |k, v|
        value[k.to_s.camelize(:lower)] = camel_munge v
        value.delete k
      end
    else
      value
    end
  end

  def camel_name
    self.class.name.camelize(:lower)
  end

  def munge(value)
    value = camel_munge(value)
  end
end
