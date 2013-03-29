# encoding: utf-8

Adhearsion.router do
  wa = WorkplaceAssociation.where(active: true).all
  inbound = wa.map { |w| w if w.associated_route.kind_of? InboundRoute }
  inbound.compact!

  outbound = wa.map { |w| w if w.associated_route.kind_of? OutboundRoute }
  outbound.compact!

  reachable = Workplace.where( intercom_reachable: true ).all.map { |w| w.name }
  names = Workplace.all.map { |w| w.name }

  from_regex = /^.*<SIP\/#{names.join '|'}>$/
  to_regex = /^#{reachable.join '|'}$/
  not_from_regex = /^.*<SIP\/((?!#{names.join '|'}).)*>$/
  not_to_regex = /^((?!#{reachable.join '|'}).)*$/

  ga = GroupAssociation.where(active: true).all
  group_inbound = ga.map { |g| g if g.associated_route.kind_of? InboundRoute }
  group_inbound.compact!

  ia = IvrAssociation.where(active: true).all
  ivr_inbound = ia.map { |i| i if i.associated_route.kind_of? InboundRoute }
  ivr_inbound.compact!

  #
  # Specify your call routes, directing calls with particular attributes to a controller
  #
  unaccepting do
    evented do
    #openended do

      #
      # Routes for intercom calls between workplaces
      #
      route "Intercom call", from: from_regex, to: to_regex do |call|
        call.options = {
          kind: :internal,
          record: false
        }
        #call.tag "options:#{JSON.generate(call.options)}"
        call.execute_controller IntercomController.new( call )
      end

      #
      # Routes for outbound calls to workplaces
      #
      outbound.each do |out|
        name = out.workplace.name
        route "Outbound call from #{name}", from: /^.*<SIP\/#{name}>$/, to: not_to_regex do |call|
          call.options = {
            kind: :outbound,
            record: out.recorded,
            uplink: "sip/#{out.associated_route.gateway.name}",
            line: out.associated_route.sip_uri
          }
          #call.tag "options:#{JSON.generate(call.options)}"
          call.execute_controller WorkplaceOutboundController.new( call )
        end
      end

      #
      # Routes for inbound calls to workplaces
      #
      inbound.each do |inbound|
        sip_uri = inbound.associated_route.sip_uri
        route "Inbound call to workplace '#{sip_uri}'", to: sip_uri, from: not_from_regex do |call|
          call.options = {
            kind: :inbound,
            record: inbound.recorded,
            target: inbound.workplace.name
          }
          #call.tag "options:#{JSON.generate(call.options)}"
          call.execute_controller WorkplaceInboundController.new( call )
        end
      end

      #
      # Routes for inbound calls to groups
      #
      group_inbound.each do |inbound|
        sip_uri = inbound.associated_route.sip_uri
        route "Inbound call to group '#{inbound.group.name}'", to: sip_uri, from: not_from_regex do |call|
          call.options = {
            kind: :inbound,
            record: inbound.recorded,
            group: inbound.group.id
          }
          #call.tag "options:#{JSON.generate(call.options)}"
          call.execute_controller GroupInboundController.new( call )
        end
      end

      #
      # Routes for inbound calls to IVRs
      #
      ivr_inbound.each do |inbound|
        ivr = inbound.ivr
        uri = inbound.associated_route.sip_uri
        route "Inbound call to IVR '#{ivr.name}'", to: uri, from: not_from_regex do |call|
          call.options = {
            kind: :inbound,
            record: inbound.recorded,
            ivr: ivr.id
          }
          #call.tag "options:#{JSON.generate(call.options)}"
          call.execute_controller IvrInboundController.new( call )
        end
      end

   end
  end
#=end
=begin
    num = '1020'
    evented do
      route 'Outbound calls', from: /.*<SIP\/#{num}/ do |call|
        call.tag 'kind:outbound'
        call.tag 'uplink:SIP/10.0.3.2'
        call.tag 'line:600512'
        #Adhearsion::CallController.exec( OutboundCalls )
        call.execute_controller OutboundCalls.new( call )
      end
    end
=end
=begin
  openended do route 'head back to the asterisk' do
      logger.info 'headed back'
    end
  end
=end

  #route 'default', CallCenter
end
