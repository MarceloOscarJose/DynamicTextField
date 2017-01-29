Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "DynamicTextField"
s.summary = "Text field configurable"
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4
s.author = { "Marcelo Oscar José" => "marcelo.oscar.jose@gmail.com" }

s.homepage = "[Your RWPickFlavor Homepage URL Goes Here]"

# For example,
# s.homepage = "https://github.com/MarceloOscarJose/DynamicTextField"


# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/MarceloOscarJose/DynamicTextField.git", :tag => "#{s.version}"}

# 7
s.framework = "UIKit"

# 8
s.source_files = "DynamicTextField/**/*.{swift}"

end
