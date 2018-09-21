cask 'little-snitch-halyard' do
  version '4.2'
  sha256 '4047f27b9d2979bed854c29e72949b15bb8f872c522383431bd8a3df95443cb9'

  url "https://www.obdev.at/downloads/littlesnitch/LittleSnitch-#{version}.dmg"
  name 'Little Snitch'
  homepage 'https://www.obdev.at/products/littlesnitch/index.html'

  container type: :naked
  installer manual: "LittleSnitch-#{version}.dmg/Little Snitch Installer.app"

  uninstall launchctl: [
                         'at.obdev.LittleSnitchUIAgent',
                         'at.obdev.LittleSnitchHelper',
                         'at.obdev.littlesnitchd',
                       ]

  zap trash: [
               '/Library/Application Support/Objective Development/Little Snitch',
               '/Library/Caches/at.obdev.LittleSnitchConfiguration',
               '/Library/Little Snitch',
               '/Library/Logs/LittleSnitchDaemon.log',
               '~/Library/Application Support/Little Snitch',
               '~/Library/Caches/at.obdev.LittleSnitchAgent',
               '~/Library/Caches/at.obdev.LittleSnitchConfiguration',
               '~/Library/Caches/at.obdev.LittleSnitchHelper',
               '~/Library/Caches/at.obdev.LittleSnitchSoftwareUpdate',
               '~/Library/Caches/com.apple.helpd/Generated/at.obdev.LittleSnitchConfiguration.help*',
               '~/Library/Caches/com.apple.helpd/SDMHelpData/Other/English/HelpSDMIndexFile/at.obdev.LittleSnitchConfiguration.help*',
               '~/Library/Logs/Little Snitch Agent.log',
               '~/Library/Logs/Little Snitch Helper.log',
               '~/Library/Logs/Little Snitch Installer.log',
               '~/Library/Logs/Little Snitch Network Monitor.log',
               '~/Library/Preferences/at.obdev.LittleSnitchAgent.plist',
               '~/Library/Preferences/at.obdev.LittleSnitchConfiguration.plist',
               '~/Library/Preferences/at.obdev.LittleSnitchInstaller.plist',
               '~/Library/Preferences/at.obdev.LittleSnitchNetworkMonitor.plist',
               '~/Library/Preferences/at.obdev.LittleSnitchSoftwareUpdate.plist',
               '~/Library/Saved Application State/at.obdev.LittleSnitchInstaller.savedState',
               '~/Library/WebKit/at.obdev.LittleSnitchConfiguration',
               # These kext's should not be uninstalled by Cask
               '/Library/Extensions/LittleSnitch.kext',
               '/Library/StagedExtensions/Library/Extensions/LittleSnitch.kext',
             ],
      rmdir: '/Library/Application Support/Objective Development'

  caveats do
    kext
    reboot
  end
end
