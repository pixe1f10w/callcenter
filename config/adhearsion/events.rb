# encoding: utf-8

Adhearsion::Events.draw do

  # Register global handlers for events
  #
  # eg. Handling Punchblock events
  #punchblock do |event|

  punchblock  Punchblock::Event::Offer do |event|
    logger.info "offered #{event.target_call_id}"
    Call.create uniqueid: event.target_call_id.to_s, from: event.from, to: event.to
  end

  punchblock  Punchblock::Event::Answered do |event|
    logger.info "answered #{event.target_call_id}"
    unless Call.where( Call.primary_key_hash( event.target_call_id.to_s ) ).empty?
      call = Call.find! event.target_call_id.to_s
      call.answered_at = DateTime.current
      call.save
    end
  end

  punchblock  Punchblock::Event::End do |event|
    logger.info "ended #{event.target_call_id}"
    logger.info Adhearsion::active_calls[ event.target_call_id ].tags
    unless Call.where( Call.primary_key_hash( event.target_call_id.to_s ) ).empty?
      call = Call.find! event.target_call_id.to_s
      call.ended_at = DateTime.current
      call.save
    end
  end

  punchblock  Punchblock::Event::Joined do |event|
    logger.info "joined #{event.target_call_id}"
    unless Call.where( Call.primary_key_hash( event.target_call_id.to_s ) ).empty?
      call = Call.find! event.target_call_id.to_s
      call.joined_at = DateTime.current
      call.save
    end
  end

  punchblock  Punchblock::Event::Unjoined do |event|
    logger.info "unjoined #{event.target_call_id}"
    unless Call.where( Call.primary_key_hash( event.target_call_id.to_s ) ).empty?
      call = Call.find! event.target_call_id.to_s
      call.unjoined_at = DateTime.current
      call.save
    end
  end
=begin
  ami name: 'Newexten' do|e|
    logger.info 'create'
  end

  ami name: 'Join' do |e|
    logger.info 'joined_at'
  end

  ami name: 'Bridge' do |e|
    logger.info e.attributes_hash[ 'uniqueid1']
    #e.attributes_hash.each do |k,v|
    #  logger.info "# #{k} - #{v}"
    #end
    logger.info 'answered_at'
  end

  ami name: 'Hangup' do |e|
    logger.info 'ended_at'
  end
=end
=begin
  ami name: 'Hangup' do |event|
    logger.info '========================================================================='
    logger.info event
    event.attributes_hash.each do |k,v|
      logger.info "# #{k} - #{v}"
    end
    logger.info '========================================================================='
  end

  ami name: 'Newexten' do |event|
    logger.info '=====================new call here====================================='
    logger.info event
    event.attributes_hash.each do |k,v|
      logger.info "# #{k} - #{v}"
    end
    logger.info '========================================================================='
  end
=end
=begin
  #   ...
  # end
  #
  # eg Handling PeerStatus AMI events
  ami :name => 'PeerStatus' do |event|
    logger.info '##########################################################################'
    event.attributes_hash.each do |k,v|
      logger.info "# #{k} - #{v}"
    end
    logger.info '##########################################################################'
  end

  ami :name => 'QueueMemberStatus' do |event|
    logger.info '***************************************************************************'
    event.attributes_hash.each do |k,v|
      logger.info "# #{k} - #{v}"
    end
    logger.info '***************************************************************************'
  end
  #   ...
  # end
  #
=end
end
