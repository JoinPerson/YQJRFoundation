Pod::Spec.new do |s|
    s.name         = 'YQJRFoundation'
    s.version      = '0.0.10'
    s.summary      = '类似于iOS系统的Foundation库'
    s.homepage     = 'https://github.com/JoinPerson/YQJRFoundation'
    s.license      = { :type => 'MIT', :file => 'LICENSE' }
    s.authors      = {'wangzhen' => '867480592@qq.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/JoinPerson/YQJRFoundation.git', :tag => s.version}
    s.source_files = 'YQJRFoundation/Classes/*.{h,m}'
    s.public_header_files = 'YQJRFoundation/Classes/*.h'
    s.libraries = 'resolv'
end
