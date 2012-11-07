# encoding: utf-8

Adhearsion::Events.draw do

  # Register global handlers for events
  #
  # eg. Handling Punchblock events
  #punchblock do |event|
  punchblock  Punchblock::Event::Answered do |event|
    puts event
  end

  punchblock  Punchblock::Event::Joined do |event|
    puts event
  end
=begin
  ami name: 'Hangup' do |event|
    puts '========================================================================='
    puts event
    event.attributes_hash.each do |k,v|
      puts "# #{k} - #{v}"
    end
    puts '========================================================================='
  end
=end
  ami name: 'Newexten' do |event|
    puts '=====================new call here====================================='
    puts event
    event.attributes_hash.each do |k,v|
      puts "# #{k} - #{v}"
    end
    puts '========================================================================='
  end
=begin
  #   ...
  # end
  #
  # eg Handling PeerStatus AMI events
  ami :name => 'PeerStatus' do |event|
    puts '##########################################################################'
    event.attributes_hash.each do |k,v|
      puts "# #{k} - #{v}"
    end
    puts '##########################################################################'
  end

  ami :name => 'QueueMemberStatus' do |event|
    puts '***************************************************************************'
    event.attributes_hash.each do |k,v|
      puts "# #{k} - #{v}"
    end
    puts '***************************************************************************'
  end
  #   ...
  # end
  #
=end
end
