Facter.add(:root_device) do
    confine :operatingsystem => :Gentoo
    setcode do
        root_device = nil
        output = %x{/bin/mount | grep " on / " | awk '{ print $1 }'}
        root_device = output.chop!
        root_device
    end
end

