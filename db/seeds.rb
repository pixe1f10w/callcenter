# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
devices = Device.create [ { name: '1015', type: 'friend', defaultuser: '1015', secret: '12345', host: 'dynamic', context: 'testing' },
                          { name: '1020', type: 'friend', defaultuser: '1020', secret: '12345', host: 'dynamic', context: 'testing' } ]

queue = CallQueue.create name: 'testing', musiconhold: 'default', strategy: 'random', timeout: 15, retry: 5

member = QueueMember.create membername: 'John Doe', device_id: devices.first, call_queue_id: queue
