cask 'virtualbox-extension-pack-halyard' do
  version '6.0.0,127566'
  sha256 'b99ef88b0ac1abebc7a6d7168dd5eec58c426f05acf69c4055defff175038f57'

  url "https://download.virtualbox.org/virtualbox/#{version.before_comma}/Oracle_VM_VirtualBox_Extension_Pack-#{version.before_comma}-#{version.after_comma}.vbox-extpack"
  name 'Oracle VirtualBox Extension Pack'
  homepage 'https://www.virtualbox.org/'

  depends_on cask: 'virtualbox-halyard'
  container type: :naked

  stage_only true

  postflight do
    system_command '/usr/local/bin/VBoxManage',
                   args:  [
                            'extpack', 'install',
                            '--replace', "#{staged_path}/Oracle_VM_VirtualBox_Extension_Pack-#{version.before_comma}-#{version.after_comma}.vbox-extpack"
                          ],
                   input: 'y',
                   sudo:  true
  end

  uninstall_postflight do
    next unless File.exist?('/usr/local/bin/VBoxManage')
    system_command '/usr/local/bin/VBoxManage',
                   args: [
                           'extpack', 'uninstall',
                           'Oracle VM VirtualBox Extension Pack'
                         ],
                   sudo: true
  end

  caveats do
    license 'https://www.virtualbox.org/wiki/VirtualBox_PUEL'
  end
end
