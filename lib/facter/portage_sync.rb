Facter.add(:portage_sync) do
    confine :operatingsystem => :Gentoo
    setcode do
        sync_time = nil
        output = %x{/usr/bin/date "+%s" -f /usr/portage/metadata/timestamp}
        sync_time = output.chop!
        sync_time
    end
end

