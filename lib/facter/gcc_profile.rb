Facter.add(:gcc_profile) do
    confine :operatingsystem => :Gentoo
    setcode do
        profile = nil
        output = %x{/usr/bin/gcc-config -c}
        profile = output.chop!
        profile
    end
end

