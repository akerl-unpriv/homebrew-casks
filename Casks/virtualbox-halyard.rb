cask 'virtualbox-halyard' do
  version '5.2.0-118431'
  sha256 'bda9f0e51ba04c23e3483a50bccede122049b805cd517d6715ca9fb161e84849'

  url "http://download.virtualbox.org/virtualbox/#{version.sub(%r{-.*}, '')}/VirtualBox-#{version}-OSX.dmg"
  name 'Oracle VirtualBox'
  homepage 'https://www.virtualbox.org/'

  pkg 'VirtualBox.pkg'

  uninstall_preflight do
    if File.exist?("#{HOMEBREW_PREFIX}/Caskroom/virtualbox-extension-pack-halyard")
      system_command 'brew', args: ['cask', 'uninstall', 'virtualbox-extension-pack-halyard']
    end
  end

  uninstall script:  {
                       executable: 'VirtualBox_Uninstall.tool',
                       args:       ['--unattended'],
                       sudo:       true,
                     },
            pkgutil: 'org.virtualbox.pkg.*'

  zap delete: [
                '~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.virtualbox.app.virtualbox.sfl*',
                '~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.virtualbox.app.virtualboxvm.sfl*',
                '~/Library/Saved Application State/org.virtualbox.app.VirtualBox.savedState',
                '~/Library/Saved Application State/org.virtualbox.app.VirtualBoxVM.savedState',
              ],
      trash:  [
                '/Library/Application Support/VirtualBox',
                '~/Library/VirtualBox',
                '~/Library/Preferences/org.virtualbox.app.VirtualBox.plist',
                '~/Library/Preferences/org.virtualbox.app.VirtualBoxVM.plist',
              ],
      rmdir:  '~/VirtualBox VMs'
end