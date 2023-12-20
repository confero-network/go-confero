Pod::Spec.new do |spec|
  spec.name         = 'Gcofe'
  spec.version      = '{{.Version}}'
  spec.license      = { :type => 'GNU Lesser General Public License, Version 3.0' }
  spec.homepage     = 'https://github.com/confero-network/go-confero'
  spec.authors      = { {{range .Contributors}}
		'{{.Name}}' => '{{.Email}}',{{end}}
	}
  spec.summary      = 'iOS Confero Client'
  spec.source       = { :git => 'https://github.com/confero-network/go-confero.git', :commit => '{{.Commit}}' }

	spec.platform = :ios
  spec.ios.deployment_target  = '9.0'
	spec.ios.vendored_frameworks = 'Frameworks/Gcofe.framework'

	spec.prepare_command = <<-CMD
    curl https://gcofestore.blob.core.windows.net/builds/{{.Archive}}.tar.gz | tar -xvz
    mkdir Frameworks
    mv {{.Archive}}/Gcofe.framework Frameworks
    rm -rf {{.Archive}}
  CMD
end
