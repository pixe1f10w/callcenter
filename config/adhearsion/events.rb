# encoding: utf-8

Adhearsion::Events.draw do

  # Register global handlers for events
  #
  # eg. Handling Punchblock events
  #punchblock do |event|
  punchblock  Punchblock::Event::Answered do |event|
    puts "answered #{event.target_call_id}"
    begin
      call = Call.find event.target_call_id
      call.answered_at = DateTime.current
      call.save
    rescue ActiveRecord::RecordNotFound => e
      puts e
    end
  end

  punchblock  Punchblock::Event::Offer do |event|
    puts "offered #{event.target_call_id}"
    Call.create uniqueid: event.target_call_id, from: event.from, to: event.to
  end

  punchblock  Punchblock::Event::End do |event|
    puts "ended #{event.target_call_id}"
    begin
      call = Call.find event.target_call_id
      call.ended_at = DateTime.current
      call.save
    rescue ActiveRecord::RecordNotFound => e
      puts e
    end
  end

  punchblock  Punchblock::Event::Joined do |event|
    puts "joined #{event.target_call_id}"
    begin
      call = Call.find event.target_call_id
      call.joined_at = DateTime.current
      call.save
    rescue ActiveRecord::RecordNotFound => e
      puts e
    end
  end

  punchblock  Punchblock::Event::Unjoined do |event|
    puts 'unjoined'
    begin
      call = Call.find event.target_call_id
      call.unjoined_at = DateTime.current
      call.save
    rescue ActiveRecord::RecordNotFound => e
      puts e
    end
  end
=begin
  ami name: 'Newexten' do|e|
    puts 'create'
  end

  ami name: 'Join' do |e|
    puts 'joined_at'
  end

  ami name: 'Bridge' do |e|
    puts e.attributes_hash[ 'uniqueid1']
    #e.attributes_hash.each do |k,v|
    #  puts "# #{k} - #{v}"
    #end
    puts 'answered_at'
  end

  ami name: 'Hangup' do |e|
    puts 'ended_at'
  end
=end
=begin
  ami name: 'Hangup' do |event|
    puts '========================================================================='
    puts event
    event.attributes_hash.each do |k,v|
      puts "# #{k} - #{v}"
    end
    puts '========================================================================='
  end

  ami name: 'Newexten' do |event|
    puts '=====================new call here====================================='
    puts event
    event.attributes_hash.each do |k,v|
      puts "# #{k} - #{v}"
    end
    puts '========================================================================='
  end
=end
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
