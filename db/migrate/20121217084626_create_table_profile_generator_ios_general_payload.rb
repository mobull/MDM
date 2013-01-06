class CreateTableProfileGeneratorIosGeneralPayload < ActiveRecord::Migration
  def change
    create_table :profile_generator_ios_general_payload do |t|
      # https://developer.apple.com/library/ios/featuredarticles/iPhoneConfigurationProfileRef/Introduction/Introduction.html#//apple_ref/doc/uid/TP40010206-CH1-SW7

      t.boolean     'HasRemovalPasscode'
      t.boolean     'IsEncrypted'
      # Array       'PayloadContent'
      t.string      'PayloadDescription'
      t.string      'PayloadDisplayName'
      # t.string      'PayloadIdentifier',          null: false                           # It should be calculated from the global variable.
      # t.string      'PayloadOrganization'                                               # It should be inheritated from the global variable.
      # t.string      'PayloadUUID',                null: false                           # It should be generated before the delivery.
      t.boolean     'PayloadRemovalDisallowed'
      t.string      'PayloadType',                null: false, default: 'Configuration'
      t.integer     'PayloadVersion',             null: false, default: 1
      t.boolean     'PayloadScope'
      t.date        'RemovalDate'
      t.float       'DurationUntilRemoval'
      # Dictionary  'ConsentText'

      t.timestamps
    end
  end
end
