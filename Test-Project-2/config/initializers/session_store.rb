Rails.application.config.session_store :active_record_store, key: (Rails.env.production? ? '_test-project-2_session_id' : (Rails.env.demo? ? '_test-project-2_demo_session_id' : '_test-project-2_dev_session_id')),
                                                             expire_after: (Rails.env.development? ? 99.years :  90.minutes),
                                                             secure: (Rails.env.demo? || Rails.env.production?),
                                                             httponly: true
