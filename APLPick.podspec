
Pod::Spec.new do |spec|
    spec.name             = 'APLPick'
    spec.version          = '0.1.0'
    spec.summary          = 'Elegent way for picking media.'
    spec.description      = 'A Swift client for the Handling Media picking.'
    spec.homepage         = 'https://github.com/AppLineup/APLPick'
    spec.license          = { :type => 'MIT', :file => 'LICENSE' }
    spec.author           = { 'islamovic' => 'islam.abo.elsoud@gmail.com' }
    spec.source           = { :git => 'git@github.com:AppLineup/APLPick.git', :tag => spec.version.to_s }
    spec.ios.deployment_target = '9.0'
    spec.source_files = 'APLPick/Classes/**/*'
end
