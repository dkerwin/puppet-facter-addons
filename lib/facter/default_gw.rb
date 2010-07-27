Facter.add(:default_gw) do
    confine :kernel => :linux
    setcode do
        gw = nil
        output = %x{/sbin/ip route show}

        output.each { |line|
            if line =~ /^default\s+via\s+([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)/
                gw = $1
                break
            end
        }
        gw
    end
end

