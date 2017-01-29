Pod::Spec.new do |s|

    s.name         = "DynamicTextField"
    s.version      = "0.1.0"
    s.summary      = "Dynamic Text Fields with validations"
    s.homepage     = "https://github.com/MarceloOscarJose/DynamicTextField"
    s.license      = "MIT"
    s.author       = { "Marcelo Oscar Jose" => "marcelo.oscar.jose@gmail.com" }

    s.platform     = :ios
    s.source       = { :git => "https://github.com/MarceloOscarJose/DynamicTextField.git", :tag => "0.1.0" }
    s.source_files = "DynamicTextField/*.{swift}"
    s.requires_arc = true
    s.ios.deployment_target = '8.0'

end
