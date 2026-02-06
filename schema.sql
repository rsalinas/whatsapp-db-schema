CREATE TABLE props (_id INTEGER PRIMARY KEY AUTOINCREMENT, key TEXT UNIQUE, value TEXT);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE message_vcard_jid(_id INTEGER PRIMARY KEY AUTOINCREMENT, vcard_jid_row_id INTEGER, vcard_row_id INTEGER, message_row_id INTEGER);
CREATE TABLE receipt_orphaned (_id INTEGER PRIMARY KEY AUTOINCREMENT, chat_row_id INTEGER NOT NULL, from_me INTEGER NOT NULL, key_id TEXT NOT NULL, receipt_device_jid_row_id INTEGER NOT NULL, receipt_recipient_jid_row_id INTEGER, status INTEGER, timestamp INTEGER);
CREATE TABLE message(_id INTEGER PRIMARY KEY AUTOINCREMENT,chat_row_id INTEGER NOT NULL,from_me INTEGER NOT NULL,key_id TEXT NOT NULL,sender_jid_row_id INTEGER,status INTEGER,broadcast INTEGER,recipient_count INTEGER,participant_hash TEXT,origination_flags INTEGER,origin INTEGER,timestamp INTEGER,received_timestamp INTEGER,receipt_server_timestamp INTEGER,message_type INTEGER,text_data TEXT,starred INTEGER,lookup_tables INTEGER,message_add_on_flags INTEGER,view_mode INTEGER,sort_id INTEGER NOT NULL DEFAULT 0, translated_text TEXT, view_replies_thread_id INTEGER);
CREATE TABLE message_add_on_receipt_device (receipt_device_id INTEGER PRIMARY KEY AUTOINCREMENT, message_add_on_row_id INTEGER, receipt_device_jid_row_id INTEGER, receipt_device_timestamp INTEGER, primary_device_version INTEGER);
CREATE TABLE group_participant_user (_id INTEGER PRIMARY KEY AUTOINCREMENT, group_jid_row_id INTEGER NOT NULL, user_jid_row_id INTEGER NOT NULL, rank INTEGER, pending INTEGER, add_timestamp INTEGER, label TEXT, join_method INTEGER);
CREATE TABLE message_system_value_change(message_row_id INTEGER PRIMARY KEY,old_data TEXT);
CREATE TABLE newsletter(chat_row_id INTEGER PRIMARY KEY,name TEXT NOT NULL,name_id INTEGER NOT NULL,description TEXT NOT NULL,description_id INTEGER NOT NULL,picture_url TEXT,picture_id INTEGER NOT NULL,preview_url TEXT,preview_id INTEGER NOT NULL,invite_code TEXT,handle TEXT,subscribers_count INTEGER NOT NULL,membership INTEGER NOT NULL,privacy INTEGER NOT NULL,verified INTEGER NOT NULL,muted INTEGER NOT NULL,oldest_message_retrieved INTEGER NOT NULL,suspended INTEGER NOT NULL DEFAULT 0,deleted INTEGER NOT NULL DEFAULT 0,show_enforced_update_banner INTEGER,reaction_setting INTEGER,reaction_setting_blocklist STRING,reaction_setting_update_ts INTEGER,verification_source INTEGER, admin_count INTEGER, wamo_sub_plan_id INTEGER, capabilities INTEGER, wamo_sub_status INTEGER, fts_index_state INTEGER, last_fts_message_indexed INTEGER, admin_activity_tone TEXT, follower_activity_tone TEXT, admin_activity_vibrate INTEGER, follower_activity_vibrate INTEGER, admin_profile_id INTEGER, admin_profile_name TEXT, admin_profile_picture_id INTEGER, admin_profile_picture_url TEXT);
CREATE TABLE jid(_id INTEGER PRIMARY KEY AUTOINCREMENT,user TEXT NOT NULL,server TEXT NOT NULL,agent INTEGER,device INTEGER,type INTEGER,raw_string TEXT);
CREATE TABLE payment_background_order(background_id TEXT PRIMARY KEY,background_order INTEGER);
CREATE TABLE message_quoted_media(message_row_id INTEGER PRIMARY KEY,media_job_uuid TEXT,transferred INTEGER,file_path TEXT,file_size INTEGER,media_key BLOB,media_key_timestamp INTEGER,width INTEGER,height INTEGER,direct_path TEXT,message_url TEXT,mime_type TEXT,file_length INTEGER,media_name TEXT,file_hash TEXT,media_duration INTEGER,page_count INTEGER,enc_file_hash TEXT,thumbnail BLOB,media_caption TEXT, accessibility_label TEXT);
CREATE TABLE primary_device_version(user_jid_row_id INTEGER PRIMARY KEY,version INTEGER NOT NULL DEFAULT 0);
CREATE TABLE message_ui_elements_reply(message_row_id INTEGER PRIMARY KEY,element_type INTEGER,reply_values TEXT,reply_description TEXT, flow_id TEXT);
CREATE TABLE message_external_ad_content(message_row_id INTEGER PRIMARY KEY,title TEXT,body TEXT,media_type INTEGER,thumbnail_url TEXT,full_thumbnail BLOB,micro_thumbnail BLOB,media_url TEXT,source_type TEXT,source_id TEXT,source_url TEXT,render_larger_thumbnail BOOLEAN,show_ad_attribution BOOLEAN,has_icebreaker_auto_response BOOLEAN,has_click_to_call_auto_response BOOLEAN, ad_context_preview_dismissed INTEGER, source_app TEXT, automated_greeting_message_shown INTEGER, greeting_message_body TEXT, cta_payload TEXT, disable_nudge INTEGER, original_image_url TEXT, automated_greeting_message_cta_type TEXT, ctwa_clid TEXT, wtwa_ad_format BOOLEAN, ad_preview_url TEXT, wtwa_website_url TEXT);
CREATE TABLE away_messages(_id INTEGER PRIMARY KEY AUTOINCREMENT,jid TEXT UNIQUE NOT NULL);
CREATE TABLE jid_map(lid_row_id INTEGER PRIMARY KEY NOT NULL,jid_row_id INTEGER NOT NULL, sort_id INTEGER);
CREATE TABLE message_quoted_mentions(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER,jid_row_id INTEGER,display_name STRING, mention_type INTEGER);
CREATE TABLE message_system(message_row_id INTEGER PRIMARY KEY,action_type INTEGER NOT NULL);
CREATE TABLE message_quoted_blank_reply(message_row_id INTEGER PRIMARY KEY,parent_group_jid TEXT,group_subject TEXT);
CREATE TABLE addon_message_media(_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,message_row_id INTEGER NOT NULL,addon_message_index INTEGER NOT NULL,chat_row_id INTEGER,file_path TEXT,file_size INTEGER,media_key BLOB,media_key_timestamp INTEGER,width INTEGER,height INTEGER,direct_path TEXT,message_url TEXT,mime_type TEXT,file_length INTEGER,file_hash TEXT,enc_file_hash TEXT,partial_media_hash TEXT,partial_media_enc_hash TEXT,original_file_hash TEXT,thumbnail TEXT,thumbnail_direct_path TEXT,thumbnail_hash TEXT,enc_thumbnail_hash TEXT,scans_sidecar BLOB,transferred INTEGER);
CREATE TABLE message_system_reminder_sent(message_row_id INTEGER PRIMARY KEY,original_message_row_id INTEGER NOT NULL UNIQUE,original_reminder_content TEXT NOT NULL);
CREATE TABLE message_system_business_state(message_row_id INTEGER PRIMARY KEY,privacy_message_type INTEGER NOT NULL,business_name TEXT, is_deprecated INTEGER);
CREATE TABLE business_message_forward_info(message_row_id INTEGER PRIMARY KEY,business_owner_jid_row_id INTEGER NOT NULL);
CREATE TABLE message_system_linked_group_call(message_row_id INTEGER PRIMARY KEY,call_id TEXT,is_video_call INTEGER,call_type INTEGER);
CREATE TABLE quick_replies(_id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT UNIQUE NOT NULL,content TEXT NOT NULL);
CREATE TABLE message_payment_status_update(message_row_id INTEGER PRIMARY KEY,transaction_info TEXT,transaction_data TEXT,init_timestamp TEXT,update_timestamp TEXT,amount_data TEXT);
CREATE TABLE group_notification_version(group_jid_row_id INTEGER PRIMARY KEY,subject_timestamp INTEGER NOT NULL,announcement_version INTEGER NOT NULL,participant_version INTEGER NOT NULL, group_join_request_timestamp INTEGER);
CREATE TABLE newsletter_subscribers(_id INTEGER PRIMARY KEY,chat_row_id INTEGER NOT NULL,jid_row_id INTEGER,display_name TEXT,profile_picture_direct_path TEXT,subscription_time INTEGER,role INTEGER NOT NULL DEFAULT 0,type_of_fetch INTEGER NOT NULL DEFAULT 0,fetched_time INTEGER NOT NULL DEFAULT 0);
CREATE TABLE mms_thumbnail_metadata(message_row_id INTEGER PRIMARY KEY,direct_path TEXT,media_key BLOB,media_key_timestamp INTEGER,enc_thumb_hash TEXT,thumb_hash TEXT,thumb_width INTEGER,thumb_height INTEGER,transferred INTEGER,micro_thumbnail BLOB,insert_timestamp INTEGER,handle TEXT);
CREATE TABLE bot_chat_info(chat_row_id INTEGER PRIMARY KEY,pip_enabled BOOLEAN DEFAULT 0,welcome_request_message_sent BOOLEAN, bot_metrics_thread_origin TEXT);
CREATE TABLE audio_data(message_row_id INTEGER PRIMARY KEY,waveform BLOB,background_color INTEGER NOT NULL DEFAULT 0, transcription_status INTEGER, transcription_locale INTEGER, transcription_confidence_threshold INTEGER, transcription_request_locale INTEGER, transcription_feedback_submitted INTEGER, transcription_id TEXT, background_color_changed INTEGER DEFAULT 0);
CREATE TABLE status_crossposting_v3(status_message_row_id INTEGER,crossposting_session_id TEXT,crossposting_status_unique_id TEXT,state INTEGER,media_file_path TEXT,direct_url_path TEXT,destination INTEGER,PRIMARY KEY (status_message_row_id, destination));
CREATE TABLE joinable_call_log(call_log_row_id INTEGER PRIMARY KEY,call_id TEXT NOT NULL,joinable_video_call INTEGER NOT NULL DEFAULT 0,group_jid_row_id INTEGER NOT NULL DEFAULT 0, phash_identifier TEXT);
CREATE TABLE message_ephemeral(message_row_id INTEGER PRIMARY KEY,duration INTEGER NOT NULL,expire_timestamp INTEGER NOT NULL,keep_in_chat INTEGER NOT NULL DEFAULT 0,ephemeral_trigger INTEGER,ephemeral_initiated_by_me INTEGER);
CREATE TABLE media_refs(_id INTEGER PRIMARY KEY AUTOINCREMENT,path TEXT UNIQUE,ref_count INTEGER);
CREATE TABLE message_system_payment_invite_setup(message_row_id INTEGER PRIMARY KEY,service INTEGER,invite_used INTEGER);
CREATE TABLE message_bot_feedback(message_row_id INTEGER PRIMARY KEY,bot_feedback_kind INTEGER NOT NULL,bot_feedback_text TEXT NOT NULL,bot_feedback_key_remote_jid TEXT NOT NULL,bot_feedback_key_from_me INTEGER NOT NULL,bot_feedback_key_id TEXT NOT NULL,bot_feedback_kind_positive INTEGER NOT NULL DEFAULT 0,bot_feedback_kind_negative INTEGER NOT NULL DEFAULT 0);
CREATE TABLE message_system_device_change(message_row_id INTEGER PRIMARY KEY,device_added_count INTEGER,device_removed_count INTEGER);
CREATE TABLE bcall_session(_id INTEGER PRIMARY KEY AUTOINCREMENT,session_id TEXT NOT NULL UNIQUE,media_type INTEGER NOT NULL,caption TEXT,master_key BLOB NOT NULL);
CREATE TABLE integrator_display_name(integrator_id INTEGER PRIMARY KEY NOT NULL,display_name TEXT NOT NULL,status INTEGER NOT NULL,icon_path TEXT NOT NULL DEFAULT '',opt_in_status INTEGER NOT NULL DEFAULT 0,identifier_type INTEGER NOT NULL DEFAULT 0);
CREATE TABLE bot_plugin_metadata(message_row_id INTEGER PRIMARY KEY,search_provider INTEGER,plugin_type INTEGER,thumbnail_cdn_url TEXT,profile_photo_cdn_url TEXT,search_provider_url TEXT,reference_index INTEGER,profile_photo_thumbnail BLOB,search_query TEXT, favicon_cdn_url TEXT);
CREATE TABLE scheduled_calls(creation_message_row_id INTEGER PRIMARY KEY,key_id TEXT NOT NULL,key_from_me INTEGER NOT NULL,key_chat_row_id INTEGER NOT NULL,call_type INTEGER NOT NULL,scheduled_timestamp INTEGER NOT NULL,call_title TEXT NOT NULL,creator_jid_row_id INTEGER NOT NULL,is_upcoming BOOLEAN NOT NULL,call_log_row_id INTEGER);
CREATE TABLE message_view_once_media(message_row_id INTEGER PRIMARY KEY,state INTEGER NOT NULL);
CREATE TABLE message_quoted_product(message_row_id INTEGER PRIMARY KEY,business_owner_jid INTEGER,product_id TEXT,title TEXT,description TEXT,currency_code TEXT,amount_1000 INTEGER,retailer_id TEXT,url TEXT,product_image_count INTEGER,sale_amount_1000 INTEGER,body TEXT,footer TEXT, signed_url TEXT);
CREATE TABLE messages_hydrated_four_row_template(message_row_id INTEGER PRIMARY KEY,message_template_id TEXT);
CREATE TABLE message_text(message_row_id INTEGER PRIMARY KEY,description TEXT,page_title TEXT,url TEXT,font_style INTEGER,text_color INTEGER,background_color INTEGER,preview_type INTEGER,invite_link_group_type INTEGER NOT NULL DEFAULT 0,counter_abuse_token TEXT, fb_experiment_id INTEGER, social_media_post_type INTEGER, link_media_duration_seconds INTEGER, link_end_index INTEGER);
CREATE TABLE priority_inbox(_id INTEGER PRIMARY KEY AUTOINCREMENT,priority_score DOUBLE NOT NULL,version INTEGER NOT NULL,chat_row_id INTEGER NOT NULL,is_priority BOOLEAN,label_removed BOOLEAN,time_created INTEGER,deep_conversion_rate BOOLEAN);
CREATE TABLE bot_message_info(message_row_id INTEGER PRIMARY KEY,target_id TEXT,message_state INTEGER DEFAULT 0,invoker_jid_row_id INTEGER, model_type INTEGER, message_disclaimer TEXT, keyword_json TEXT, promotion_message TEXT, imagine_json TEXT, age_collection INTEGER, bot_response_id TEXT, bot_jid_row_id INTEGER, in_app_thread_survey TEXT, verification_metadata BLOB, response_viewed INTEGER, bot_group_json TEXT);
CREATE TABLE quick_reply_attachments(_id INTEGER PRIMARY KEY AUTOINCREMENT,quick_reply_id TEXT NOT NULL,uri TEXT NOT NULL,caption TEXT,media_type INTEGER);
CREATE TABLE message_details(message_row_id INTEGER PRIMARY KEY,author_device_jid INTEGER);
CREATE TABLE message_quoted_payment_invite(message_row_id INTEGER PRIMARY KEY,service INTEGER,expiration_timestamp INTEGER, incentive_eligible INTEGER);
CREATE TABLE forwarded_newsletter_message_info(message_row_id INTEGER PRIMARY KEY,newsletter_jid_row_id INTEGER NOT NULL,newsletter_server_message_id INTEGER NOT NULL,newsletter_name TEXT NOT NULL DEFAULT '', profile_name TEXT);
CREATE TABLE message_add_on_keep_in_chat(message_add_on_row_id INTEGER PRIMARY KEY,keep_in_chat_state INTEGER NOT NULL DEFAULT 0,sender_timestamp INTEGER,keep_count INTEGER NOT NULL DEFAULT 0,actor_device_jid_row_id INTEGER);
CREATE TABLE favorite(_id INTEGER PRIMARY KEY AUTOINCREMENT,jid_row_id INTEGER UNIQUE,favorite_type INTEGER,sort_order INTEGER);
CREATE TABLE status(_id INTEGER PRIMARY KEY AUTOINCREMENT,jid_row_id INTEGER UNIQUE,message_table_id INTEGER,last_read_message_table_id INTEGER,last_read_receipt_sent_message_table_id INTEGER,first_unread_message_table_id INTEGER,autodownload_limit_message_table_id INTEGER,timestamp INTEGER,unseen_count INTEGER,total_count INTEGER, unseen_count_close_friends INTEGER);
CREATE TABLE message_newsletter_admin_invite(message_row_id INTEGER PRIMARY KEY,newsletter_jid_row_id INTEGER NOT NULL,newsletter_name TEXT NOT NULL,expiration INTEGER NOT NULL);
CREATE TABLE message_system_with_group_nodes(message_row_id INTEGER NOT NULL,group_jid_row_id INTEGER NOT NULL,group_node_type INTEGER NOT NULL,group_subject TEXT,version INTEGER,PRIMARY KEY (message_row_id, group_jid_row_id, group_node_type));
CREATE TABLE message_scheduled_call(message_row_id INTEGER PRIMARY KEY,scheduled_timestamp_ms INTEGER,call_type INTEGER,title TEXT);
CREATE TABLE message_system_initial_privacy_provider(message_row_id INTEGER PRIMARY KEY,privacy_provider INTEGER NOT NULL DEFAULT 0,verified_biz_name TEXT,biz_state_id INTEGER, is_deprecated INTEGER);
CREATE TABLE group_participant_device(_id INTEGER PRIMARY KEY AUTOINCREMENT,group_participant_row_id INTEGER NOT NULL,device_jid_row_id INTEGER NOT NULL,sent_sender_key INTEGER,sent_add_on_sender_key INTEGER);
CREATE TABLE pay_transaction(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER,remote_jid_row_id INTEGER,key_id TEXT,interop_id TEXT,id TEXT,timestamp INTEGER,status INTEGER,error_code TEXT,sender_jid_row_id INTEGER,receiver_jid_row_id INTEGER,type INTEGER,currency_code TEXT,amount_1000,credential_id TEXT,methods TEXT,bank_transaction_id TEXT,metadata TEXT,init_timestamp INTEGER,request_key_id TEXT,country TEXT,version INTEGER,future_data BLOB,service_id INTEGER,background_id TEXT,purchase_initiator INTEGER);
CREATE TABLE message_add_on_scheduled_call_edit(message_add_on_row_id INTEGER PRIMARY KEY,edit_type INTEGER NOT NULL DEFAULT 0,message_edit_version INTEGER);
CREATE TABLE group_past_participant_user(_id INTEGER PRIMARY KEY AUTOINCREMENT,group_jid_row_id INTEGER NOT NULL,user_jid_row_id INTEGER NOT NULL,is_leave INTEGER NOT NULL,timestamp INTEGER);
CREATE TABLE message_add_on_pin_in_chat(message_add_on_row_id INTEGER PRIMARY KEY,pin_in_chat_state INTEGER NOT NULL DEFAULT 0,sender_timestamp INTEGER);
CREATE TABLE receipt_user(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER NOT NULL,receipt_user_jid_row_id INTEGER NOT NULL,receipt_timestamp INTEGER,read_timestamp INTEGER,played_timestamp INTEGER);
CREATE TABLE message_add_on_reaction(message_add_on_row_id INTEGER PRIMARY KEY,reaction TEXT,sender_timestamp INTEGER);
CREATE TABLE parent_group_participants(parent_group_jid_row_id INTEGER NOT NULL,user_jid_row_id INTEGER NOT NULL);
CREATE TABLE newsletter_message_reaction(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER NOT NULL,reaction TEXT NOT NULL,reaction_count INTEGER NOT NULL);
CREATE TABLE message_quoted_order(message_row_id INTEGER PRIMARY KEY,order_id TEXT,thumbnail BLOB,order_title TEXT,item_count INTEGER,status INTEGER,surface INTEGER,message TEXT,seller_jid INTEGER,token TEXT,currency_code TEXT,total_amount_1000 INTEGER,message_version INTEGER, catalog_type TEXT);
CREATE TABLE message_broadcast_ephemeral(message_row_id INTEGER PRIMARY KEY,shared_secret BLOB NOT NULL);
CREATE TABLE message_thumbnail(message_row_id INTEGER PRIMARY KEY,thumbnail BLOB);
CREATE TABLE message_product(message_row_id INTEGER PRIMARY KEY,business_owner_jid INTEGER,product_id TEXT,title TEXT,description TEXT,currency_code TEXT,amount_1000 INTEGER,retailer_id TEXT,url TEXT,product_image_count INTEGER,sale_amount_1000 INTEGER,body TEXT,footer TEXT, signed_url TEXT);
CREATE TABLE message_system_scheduled_call_start(message_row_id INTEGER PRIMARY KEY,creation_message_row_id INTEGER NOT NULL UNIQUE,call_title TEXT NOT NULL,call_timestamp_ms INTEGER NOT NULL);
CREATE TABLE message_ephemeral_sync_response(chat_jid TEXT PRIMARY KEY NOT NULL,last_sync_response_sent_timestamp INTEGER NOT NULL,no_of_retries_sent_already INTEGER NOT NULL DEFAULT 0);
CREATE TABLE message_parent_association(message_row_id INTEGER PRIMARY KEY,parent_message_row_id INTEGER NOT NULL,association_type INTEGER NOT NULL);
CREATE TABLE payment_background(background_id TEXT PRIMARY KEY,file_size INTEGER,width INTEGER,height INTEGER,mime_type TEXT,placeholder_color INTEGER,text_color INTEGER,subtext_color INTEGER,fullsize_url TEXT,description TEXT,lg TEXT,media_key BLOB,media_key_timestamp INTEGER,file_sha256 TEXT,file_enc_sha256 TEXT,direct_path TEXT);
CREATE TABLE message_poll_option(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER,option_sha256 TEXT,option_name TEXT,vote_total INTEGER, option_hash TEXT);
CREATE TABLE call_log(_id INTEGER PRIMARY KEY AUTOINCREMENT,jid_row_id INTEGER,from_me INTEGER,call_id TEXT,transaction_id INTEGER,timestamp INTEGER,video_call INTEGER,duration INTEGER,call_result INTEGER,is_dnd_mode_on INTEGER,bytes_transferred INTEGER,group_jid_row_id INTEGER NOT NULL DEFAULT 0,is_joinable_group_call INTEGER,call_creator_device_jid_row_id INTEGER NOT NULL DEFAULT 0,call_random_id TEXT,call_link_row_id INTEGER NOT NULL DEFAULT 0,call_type INTEGER,offer_silence_reason INTEGER,scheduled_id TEXT, telecom_uuid TEXT);
CREATE TABLE message_forwarded(message_row_id INTEGER PRIMARY KEY,forward_score INTEGER, forward_origin INTEGER);
CREATE TABLE newsletter_my_reaction_orphan_message(_id INTEGER PRIMARY KEY AUTOINCREMENT,chat_row_id INTEGER NOT NULL,server_message_id INTEGER NOT NULL,reaction_from_me TEXT,reactions_from_me_ts INTEGER,votes_from_me TEXT,votes_from_me_ts INTEGER);
CREATE TABLE smart_suggestions_key_value(_id INTEGER PRIMARY KEY AUTOINCREMENT,key TEXT UNIQUE,value BLOB);
CREATE TABLE message_quoted_text(message_row_id INTEGER PRIMARY KEY,thumbnail BLOB);
CREATE TABLE message_system_sibling_group_link_change(message_row_id INTEGER NOT NULL,subgroup_raw_jid TEXT NOT NULL,subgroup_subject TEXT NOT NULL,parent_group_jid_row_id INTEGER,PRIMARY KEY (message_row_id, subgroup_raw_jid));
CREATE TABLE message_system_number_change(message_row_id INTEGER PRIMARY KEY,old_jid_row_id INTEGER,new_jid_row_id INTEGER);
CREATE TABLE message_quoted(message_row_id INTEGER PRIMARY KEY AUTOINCREMENT,chat_row_id INTEGER NOT NULL,parent_message_chat_row_id INTEGER NOT NULL,from_me INTEGER NOT NULL,sender_jid_row_id INTEGER,key_id TEXT NOT NULL,timestamp INTEGER,message_type INTEGER,origin INTEGER,text_data TEXT,payment_transaction_id TEXT,lookup_tables INTEGER, quoted_source INTEGER, quoted_type INTEGER);
CREATE TABLE message_link(_id INTEGER PRIMARY KEY AUTOINCREMENT,chat_row_id INTEGER,message_row_id INTEGER,link_index INTEGER);
CREATE TABLE message_privacy_state(message_row_id INTEGER NOT NULL PRIMARY KEY,host_storage INTEGER,actual_actors INTEGER,privacy_mode_ts INTEGER NOT NULL,business_name TEXT);
CREATE TABLE message_system_ephemeral_setting_not_applied(message_row_id INTEGER PRIMARY KEY,setting_duration INTEGER);
CREATE TABLE call_unknown_caller(call_log_row_id INTEGER PRIMARY KEY);
CREATE TABLE receipt_device(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER NOT NULL,receipt_device_jid_row_id INTEGER NOT NULL,receipt_device_timestamp INTEGER,primary_device_version INTEGER);
CREATE TABLE message_media_interactive_annotation_vertex(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_media_interactive_annotation_row_id INTEGER,x REAL,y REAL,sort_order INTEGER);
CREATE TABLE message_system_reminder_setup(message_row_id INTEGER PRIMARY KEY,original_message_row_id INTEGER NOT NULL UNIQUE,reminder_timestamp_ms INTEGER NOT NULL,reminder_content TEXT NOT NULL);
CREATE TABLE message_order(message_row_id INTEGER PRIMARY KEY,order_id TEXT,thumbnail BLOB,order_title TEXT,item_count INTEGER,status INTEGER,surface INTEGER,message TEXT,seller_jid INTEGER,token TEXT,currency_code TEXT,total_amount_1000 INTEGER,message_version INTEGER, catalog_type TEXT);
CREATE TABLE message_media_interactive_annotation(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER,skip_confirmation INTEGER NOT NULL DEFAULT 0,location_latitude REAL,location_longitude REAL,location_name TEXT,newsletter_jid_row_id INTEGER,newsletter_server_message_id INTEGER,newsletter_name TEXT,newsletter_content_type INTEGER,newsletter_accessibility_text TEXT,sort_order INTEGER, child_message_row_id INTEGER, type INTEGER, fp_interactive_annotation BLOB, status_link_type INTEGER);
CREATE TABLE chat(_id INTEGER PRIMARY KEY AUTOINCREMENT,jid_row_id INTEGER UNIQUE,hidden INTEGER,subject TEXT,created_timestamp INTEGER,display_message_row_id INTEGER,last_message_row_id INTEGER,last_read_message_row_id INTEGER,last_read_receipt_sent_message_row_id INTEGER,last_important_message_row_id INTEGER,archived INTEGER,sort_timestamp INTEGER,mod_tag INTEGER,gen REAL,spam_detection INTEGER,unseen_earliest_message_received_time INTEGER,unseen_message_count INTEGER,unseen_missed_calls_count INTEGER,unseen_row_count INTEGER,plaintext_disabled INTEGER,vcard_ui_dismissed INTEGER,change_number_notified_message_row_id INTEGER,show_group_description INTEGER,ephemeral_expiration INTEGER,last_read_ephemeral_message_row_id INTEGER,ephemeral_setting_timestamp INTEGER,ephemeral_displayed_exemptions INTEGER,ephemeral_disappearing_messages_initiator INTEGER,unseen_important_message_count INTEGER NOT NULL DEFAULT 0,group_type INTEGER NOT NULL DEFAULT 0,last_message_reaction_row_id INTEGER,last_seen_message_reaction_row_id INTEGER,unseen_message_reaction_count INTEGER,unseen_comment_message_count INTEGER,growth_lock_level INTEGER,growth_lock_expiration_ts INTEGER,last_read_message_sort_id INTEGER,display_message_sort_id INTEGER,last_message_sort_id INTEGER,last_read_receipt_sent_message_sort_id INTEGER,has_new_community_admin_dialog_been_acknowledged INTEGER NOT NULL DEFAULT 0,history_sync_progress INTEGER,chat_lock INTEGER,chat_origin TEXT, participation_status INTEGER, account_jid_row_id INTEGER, chat_encryption_state INTEGER, group_member_count INTEGER, limited_sharing INTEGER, limited_sharing_setting_timestamp INTEGER, is_contact INTEGER);
CREATE TABLE message_system_block_contact(message_row_id INTEGER PRIMARY KEY,is_blocked INTEGER);
CREATE TABLE message_group_invite(message_row_id INTEGER PRIMARY KEY,group_jid_row_id INTEGER NOT NULL,admin_jid_row_id INTEGER NOT NULL,group_name TEXT,invite_code TEXT,expiration INTEGER,invite_time INTEGER,expired INTEGER,group_type INTEGER NOT NULL DEFAULT 0);
CREATE TABLE message_ui_elements(_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,message_row_id INTEGER NOT NULL,element_type INTEGER,element_content TEXT);
CREATE TABLE keywords(_id INTEGER PRIMARY KEY AUTOINCREMENT,keyword TEXT UNIQUE NOT NULL);
CREATE TABLE user_device_info(user_jid_row_id INTEGER PRIMARY KEY,raw_id INTEGER NOT NULL,timestamp INTEGER NOT NULL,expected_timestamp INTEGER,expected_ts_last_device_job_ts INTEGER,expected_timestamp_update_ts INTEGER,account_encryption_type INTEGER);
CREATE TABLE message_revoked(message_row_id INTEGER PRIMARY KEY,revoked_key_id TEXT NOT NULL,admin_jid_row_id INTEGER,revoke_timestamp INTEGER);
CREATE TABLE message_call_log(message_row_id INTEGER PRIMARY KEY,call_log_row_id INTEGER);
CREATE TABLE message_vcard(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER,vcard TEXT);
CREATE TABLE message_streaming_sidecar(message_row_id INTEGER PRIMARY KEY,sidecar BLOB,chunk_lengths BLOB,timestamp INTEGER);
CREATE TABLE message_quoted_ui_elements(message_row_id INTEGER NOT NULL PRIMARY KEY,element_type INTEGER,element_content TEXT);
CREATE TABLE message_add_on_poll_vote(message_add_on_row_id INTEGER PRIMARY KEY,sender_timestamp INTEGER);
CREATE TABLE call_link(_id INTEGER PRIMARY KEY AUTOINCREMENT,token TEXT NOT NULL,creator_jid_row_id INTEGER NOT NULL DEFAULT 0);
CREATE TABLE bot_message_prompts(message_row_id INTEGER PRIMARY KEY,chat_row_id INTEGER UNIQUE,prompts TEXT,impression_logged INTEGER DEFAULT 0);
CREATE TABLE message_system_opt_out(message_row_id INTEGER PRIMARY KEY,biz_opt_out_category INTEGER,biz_opt_out_action INTEGER);
CREATE TABLE message_secret(message_row_id INTEGER PRIMARY KEY,message_secret BLOB);
CREATE TABLE message_poll(message_row_id INTEGER PRIMARY KEY,enc_key BLOB,selectable_options_count INTEGER,invalid_state INTEGER NOT NULL DEFAULT 0,poll_logging_id INTEGER NOT NULL DEFAULT 0, poll_type INTEGER, correct_option_id INTEGER, content_type INTEGER);
CREATE TABLE message_quoted_location(message_row_id INTEGER PRIMARY KEY,latitude REAL,longitude REAL,place_name TEXT,place_address TEXT,url TEXT,thumbnail BLOB);
CREATE TABLE played_self_receipt(message_row_id INTEGER PRIMARY KEY,to_jid_row_id INTEGER NOT NULL,participant_jid_row_id INTEGER,message_id TEXT NOT NULL);
CREATE TABLE message_template_quoted(message_row_id INTEGER PRIMARY KEY,content_text_data TEXT NOT NULL,footer_text_data TEXT);
CREATE TABLE message_system_photo_change(message_row_id INTEGER PRIMARY KEY,new_photo_id TEXT,old_photo BLOB,new_photo BLOB);
CREATE TABLE message_template(message_row_id INTEGER PRIMARY KEY,content_text_data TEXT NOT NULL,footer_text_data TEXT,template_id TEXT,csat_trigger_expiration_ts INTEGER,category TEXT,tag TEXT,mask_linked_devices INTEGER);
CREATE TABLE newsletter_linked_account(_id INTEGER PRIMARY KEY AUTOINCREMENT,chat_row_id INTEGER NOT NULL,name TEXT NOT NULL,link TEXT NOT NULL);
CREATE TABLE missed_call_logs(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER,timestamp INTEGER,video_call INTEGER,group_jid_row_id INTEGER NOT NULL DEFAULT 0,is_joinable_group_call INTEGER,is_dnd_mode_on INTEGER,offer_silence_reason INTEGER);
CREATE TABLE suggest_as_you_type(message_row_id INTEGER PRIMARY KEY);
CREATE TABLE lid_display_name(lid_row_id INTEGER PRIMARY KEY NOT NULL,display_name TEXT NOT NULL,username TEXT);
CREATE TABLE message_system_chat_assignment(message_row_id INTEGER PRIMARY KEY,agent_name TEXT,is_unassigned_chat INTEGER);
CREATE TABLE message_send_count(message_row_id INTEGER PRIMARY KEY,send_count INTEGER);
CREATE TABLE message_orphaned_edit(_id INTEGER PRIMARY KEY,key_id TEXT NOT NULL,from_me INTEGER NOT NULL,chat_row_id INTEGER NOT NULL,sender_jid_row_id INTEGER NOT NULL DEFAULT 0,timestamp INTEGER,message_type INTEGER NOT NULL,revoked_key_id TEXT,retry_count INTEGER,admin_jid_row_id INTEGER,orphan_message_data BLOB, reporting_token BLOB, reporting_tag BLOB, reporting_version INTEGER);
CREATE TABLE lid_chat_state(jid_row_id INTEGER PRIMARY KEY NOT NULL,is_pn_shared INTEGER NOT NULL DEFAULT 0,pn_requested_ts INTEGER NOT NULL DEFAULT 0,pnh_duplicate_lid_thread INTEGER NOT NULL DEFAULT 0);
CREATE TABLE chat_ephemeral(chat_row_id INTEGER PRIMARY KEY,ephemeral_trigger INTEGER,ephemeral_initiated_by_me BOOLEAN);
CREATE TABLE backup_changes(_id INTEGER PRIMARY KEY AUTOINCREMENT,operation TEXT NOT NULL,table_name TEXT NOT NULL,table_row_id INTEGER NOT NULL);
CREATE TABLE message_rating(message_row_id INTEGER PRIMARY KEY,rating INTEGER NOT NULL);
CREATE TABLE message_add_on_event_response(message_add_on_row_id INTEGER PRIMARY KEY,response INTEGER DEFAULT 0,sender_timestamp INTEGER NOT NULL, extra_guest_count INTEGER);
CREATE TABLE message_payment(message_row_id INTEGER PRIMARY KEY,sender_jid_row_id INTEGER,receiver_jid_row_id INTEGER,amount_with_symbol TEXT,remote_resource TEXT,remote_message_sender_jid_row_id INTEGER,remote_message_from_me INTEGER,remote_message_key TEXT);
CREATE TABLE message_event(message_row_id INTEGER PRIMARY KEY,is_canceled INTEGER DEFAULT 0,name TEXT NOT NULL,description TEXT,location_latitude REAL,location_longitude REAL,location_name TEXT,location_address TEXT,join_link TEXT,start_time DATETIME NOT NULL,chat_row_id INTEGER,event_state INTEGER NOT NULL DEFAULT 0, end_time DATETIME, allow_extra_guests INTEGER, is_schedule_call INTEGER, has_reminder INTEGER, reminder_offset_sec INTEGER, show_upcoming_banner INTEGER);
CREATE TABLE message_add_on_poll_vote_selected_option(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_add_on_row_id INTEGER,message_poll_option_id INTEGER);
CREATE TABLE message_ephemeral_setting(message_row_id INTEGER PRIMARY KEY,setting_duration INTEGER,setting_reason INTEGER,user_jid_row_id_csv TEXT,ephemeral_trigger INTEGER,ephemeral_initiated_by_me INTEGER, pre_setting_duration INTEGER);
CREATE TABLE message_system_group(message_row_id INTEGER PRIMARY KEY,is_me_joined INTEGER);
CREATE TABLE message_quoted_ui_elements_reply(message_row_id INTEGER PRIMARY KEY,element_type INTEGER,reply_values TEXT,reply_description TEXT);
CREATE TABLE premium_message_info(message_row_id INTEGER PRIMARY KEY,campaign_id STRING NOT NULL, chat_row_id INTEGER, account_jid_row_id INTEGER);
CREATE TABLE message_template_button(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER,text_data TEXT NOT NULL,extra_data TEXT,button_type INTEGER,used INTEGER,selected_index INTEGER,selected_carousel_card_index INTEGER,otp_button_type INTEGER,extra_consent_data TEXT,otp_matched_package_name TEXT,webview_presentation INTEGER, webview_interaction INTEGER);
CREATE TABLE message_location(message_row_id INTEGER PRIMARY KEY,chat_row_id INTEGER,latitude REAL,longitude REAL,place_name TEXT,place_address TEXT,url TEXT,live_location_share_duration INTEGER,live_location_sequence_number INTEGER,live_location_final_latitude REAL,live_location_final_longitude REAL,live_location_final_timestamp INTEGER,map_download_status INTEGER);
CREATE TABLE message_status_psa_campaign(message_row_id INTEGER PRIMARY KEY,campaign_id TEXT,duration INTEGER,first_seen_timestamp INTEGER,action_link_url TEXT,action_link_button_title TEXT);
CREATE TABLE frequent(_id INTEGER PRIMARY KEY AUTOINCREMENT,jid_row_id INTEGER NOT NULL,type INTEGER NOT NULL,message_count INTEGER NOT NULL);
CREATE TABLE media_hash_thumbnail(media_hash TEXT PRIMARY KEY,thumbnail BLOB);
CREATE TABLE data_sharing_disclosure_metadata(message_row_id INTEGER PRIMARY KEY,show_mm_disclosure BOOLEAN);
CREATE TABLE agent_message_attribution(message_row_id INTEGER PRIMARY KEY,agent_id TEXT NOT NULL);
CREATE TABLE template_messages_metadata(message_row_id INTEGER PRIMARY KEY,message_template_id TEXT,message_hsm_tag TEXT, message_source_type TEXT, message_delivery_decision_id TEXT, message_delivery_decision_sources TEXT);
CREATE TABLE community_chat(chat_row_id INTEGER PRIMARY KEY,last_activity_ts INTEGER,last_activity_seen_ts INTEGER,join_ts INTEGER,closed INTEGER NOT NULL DEFAULT 0);
CREATE TABLE missed_call_log_participant(_id INTEGER PRIMARY KEY AUTOINCREMENT,call_logs_row_id INTEGER,jid TEXT,call_result INTEGER);
CREATE TABLE message_media_vcard_count(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER,count INTEGER);
CREATE TABLE agent_devices(agent_id TEXT PRIMARY KEY NOT NULL,agent_name TEXT UNIQUE NOT NULL,device INTEGER,last_modified_time INTEGER,is_deleted BOOLEAN);
CREATE TABLE quick_reply_usage(_id INTEGER PRIMARY KEY AUTOINCREMENT,quick_reply_id TEXT NOT NULL,usage_date DATE,usage_count INTEGER);
CREATE TABLE message_comment(_id INTEGER PRIMARY KEY AUTOINCREMENT,parent_message_row_id INTEGER,message_row_id INTEGER);
CREATE TABLE message_quoted_vcard(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER,vcard TEXT);
CREATE TABLE message_invoice(message_row_id INTEGER PRIMARY KEY,wa_invoice_id TEXT NOT NULL,amount TEXT NOT NULL,note TEXT NOT NULL,token TEXT,sender_jid_row_id INTEGER,receiver_jid_row_id INTEGER,status INTEGER,status_ts INTEGER,creation_ts INTEGER,attachment_type INTEGER,attachment_mimetype TEXT,attachment_media_key BLOB,attachment_media_key_ts INTEGER,attachment_file_sha256 BLOB,attachment_file_enc_sha256 BLOB,attachment_direct_path TEXT,attachment_jpeg_thumbnail BLOB,metadata TEXT);
CREATE TABLE message_mentions(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER,jid_row_id INTEGER,display_name STRING, mention_type INTEGER);
CREATE TABLE quick_reply_keywords(_id INTEGER PRIMARY KEY AUTOINCREMENT,quick_reply_id TEXT NOT NULL,keyword_id TEXT NOT NULL);
CREATE TABLE message_system_group_with_parent(message_row_id INTEGER PRIMARY KEY,linked_parent_group_name TEXT);
CREATE TABLE message_quoted_call_log(message_row_id INTEGER PRIMARY KEY,video_call BOOLEAN,call_result INTEGER);
CREATE TABLE message_payment_transaction_reminder(message_row_id INTEGER PRIMARY KEY,web_stub TEXT,amount TEXT,transfer_date TEXT,payment_sender_name TEXT,expiration INTEGER,remote_message_key TEXT);
CREATE TABLE newsletter_message(message_row_id INTEGER PRIMARY KEY,chat_row_id INTEGER NOT NULL,server_message_id INTEGER NOT NULL,comments_count INTEGER NOT NULL DEFAULT 0,reaction_from_me TEXT,extra_newsletter_tables INTEGER NOT NULL DEFAULT 0,extra_table_last_update_ts INTEGER,reactions_from_me_ts INTEGER,view_count INTEGER, is_autodelete_eligible INTEGER, is_wamo_sub INTEGER, forwards_count INTEGER, admin_profile_id INTEGER, admin_profile_name TEXT, admin_profile_picture_id INTEGER, admin_profile_picture_url TEXT, is_paid_partnership INTEGER);
CREATE TABLE invoice_transactions(message_row_id INTEGER PRIMARY KEY,pay_transaction_id INTEGER);
CREATE TABLE message_edit_info(message_row_id INTEGER PRIMARY KEY,original_key_id TEXT NOT NULL,edited_timestamp INTEGER NOT NULL,sender_timestamp INTEGER NOT NULL);
CREATE TABLE status_message_info(message_row_id INTEGER PRIMARY KEY,status_distribution_mode INTEGER NOT NULL, is_mentioned INTEGER, status_mentions TEXT, cannot_receive_reactions INTEGER, cannot_be_ranked INTEGER, has_embedded_music INTEGER, status_mention_source TEXT, status_attribution_type INTEGER, is_group_status INTEGER, can_be_reshared INTEGER, ranking_version INTEGER, external_media_duration_seconds INTEGER, original_status_message_row_id INTEGER, original_poster_notification_type INTEGER, status_source_type INTEGER, selected_audience_list TEXT, override_notification_recipient_jid TEXT, can_receive_multi_reactions INTEGER, audience_type INTEGER, status_poster_contact_type INTEGER);
CREATE TABLE message_quote_invoice(message_row_id INTEGER PRIMARY KEY,amount TEXT NOT NULL,note TEXT NOT NULL,status INTEGER,attachment_jpeg_thumbnail BLOB);
CREATE TABLE message_bcall_session(message_row_id INTEGER PRIMARY KEY,bcall_session_row_id INTEGER);
CREATE TABLE agent_chat_assignment(jid_row_id INTEGER PRIMARY KEY,agent_id TEXT NOT NULL,is_opened BOOLEAN, account_jid_row_id INTEGER);
CREATE TABLE message_fixed_content_placeholder(message_row_id INTEGER PRIMARY KEY,placeholder_type INTEGER NOT NULL);
CREATE TABLE message_media(message_row_id INTEGER PRIMARY KEY,chat_row_id INTEGER,autotransfer_retry_enabled INTEGER,multicast_id TEXT,media_job_uuid TEXT,transferred INTEGER,transcoded INTEGER,file_path TEXT,file_size INTEGER,suspicious_content INTEGER,trim_from INTEGER,trim_to INTEGER,face_x INTEGER,face_y INTEGER,media_key BLOB,media_key_timestamp INTEGER,width INTEGER,height INTEGER,has_streaming_sidecar INTEGER,gif_attribution INTEGER,thumbnail_height_width_ratio REAL,direct_path TEXT,first_scan_sidecar BLOB,first_scan_length INTEGER,message_url TEXT,mime_type TEXT,file_length INTEGER,media_name TEXT,file_hash TEXT,media_duration INTEGER,page_count INTEGER,enc_file_hash TEXT,partial_media_hash TEXT,partial_media_enc_hash TEXT,is_animated_sticker INTEGER,original_file_hash TEXT,mute_video INTEGER DEFAULT 0,media_caption TEXT,media_upload_handle TEXT,sticker_flags INTEGER, raw_transcription_text TEXT, first_viewed_timestamp INTEGER, doodle_id TEXT, media_source_type INTEGER, accessibility_label TEXT, media_transcode_quality INTEGER DEFAULT 0, metadata_url TEXT, motion_photo_presentation_offset_ms INTEGER, qr_url TEXT);
CREATE TABLE user_device(_id INTEGER PRIMARY KEY AUTOINCREMENT,user_jid_row_id INTEGER,device_jid_row_id INTEGER,key_index INTEGER NOT NULL DEFAULT 0);
CREATE TABLE message_system_group_auto_restrict(message_row_id INTEGER PRIMARY KEY,threshold INTEGER);
CREATE TABLE message_orphan(_id INTEGER PRIMARY KEY AUTOINCREMENT,chat_row_id INTEGER,from_me INTEGER,key_id TEXT NOT NULL,sender_jid_row_id INTEGER,parent_chat_row_id INTEGER,parent_from_me INTEGER,parent_key_id TEXT,parent_sender_jid_row_id INTEGER,timestamp INTEGER,orphan_message_data BLOB,orphan_message_type INTEGER,orphan_message_stanza_data BLOB, orphan_message_reason INTEGER);
CREATE TABLE deleted_chat_job(_id INTEGER PRIMARY KEY AUTOINCREMENT,chat_row_id INTEGER NOT NULL,block_size INTEGER,singular_message_delete_rows_id TEXT,deleted_message_row_id INTEGER,deleted_starred_message_row_id INTEGER,deleted_messages_remove_files BOOLEAN,deleted_categories_message_row_id INTEGER,deleted_categories_starred_message_row_id INTEGER,deleted_categories_remove_files BOOLEAN,deleted_message_categories TEXT,delete_files_singular_delete BOOLEAN);
CREATE TABLE suggested_replies(message_row_id INTEGER PRIMARY KEY,customer_message_row_id INTEGER NOT NULL,tokenized_customer_message STRING,customer_message_embedding BLOB);
CREATE TABLE message_system_chat_participant(message_row_id INTEGER,user_jid_row_id INTEGER);
CREATE TABLE message_system_community_link_changed(message_row_id INTEGER PRIMARY KEY,old_group_type INTEGER,new_group_type INTEGER NOT NULL,linked_parent_group_jid_row_id INTEGER);
CREATE TABLE call_log_participant_v2(_id INTEGER PRIMARY KEY AUTOINCREMENT,call_log_row_id INTEGER,jid_row_id INTEGER,call_result INTEGER);
CREATE TABLE message_payment_invite(message_row_id INTEGER PRIMARY KEY,service INTEGER,expiration_timestamp INTEGER, incentive_eligible INTEGER);
CREATE TABLE message_add_on(_id INTEGER PRIMARY KEY AUTOINCREMENT,chat_row_id INTEGER,from_me INTEGER,key_id TEXT NOT NULL,sender_jid_row_id INTEGER,parent_message_row_id INTEGER,timestamp INTEGER,status INTEGER,message_add_on_type INTEGER,received_timestamp INTEGER,expiry_duration_in_secs INTEGER,server_timestamp INTEGER,expiry_timestamp INTEGER, expiry_type INTEGER);
CREATE TABLE message_future(message_row_id INTEGER PRIMARY KEY,version INTEGER,data BLOB,future_message_type INTEGER,future_proof_stanza BLOB,edit_version INTEGER, message_stanza_data BLOB);
CREATE TABLE message_comment_parent(message_row_id INTEGER PRIMARY KEY,chat_row_id INTEGER,number_of_comments INTEGER NOT NULL,last_comment_ts INTEGER,last_comment_message_row_id INTEGER);
CREATE TABLE scheduled_reminder_message(message_row_id INTEGER PRIMARY KEY,scheduled_reminder_timestamp_ms INTEGER NOT NULL, chat_row_id INTEGER);
CREATE TABLE message_quoted_group_invite(message_row_id INTEGER PRIMARY KEY,group_jid_row_id INTEGER NOT NULL,admin_jid_row_id INTEGER NOT NULL,group_name TEXT,invite_code TEXT,expiration INTEGER,invite_time INTEGER,expired INTEGER,group_type INTEGER NOT NULL DEFAULT 0);
CREATE TABLE message_system_event_updates(message_row_id INTEGER PRIMARY KEY,event_message_row_id INTEGER NOT NULL,event_name STRING NOT NULL);
CREATE TABLE android_metadata (locale TEXT);
CREATE TABLE transcription_segment(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER NOT NULL,substring_start INTEGER NOT NULL,substring_length INTEGER NOT NULL,timestamp INTEGER,duration INTEGER,confidence INTEGER);
CREATE TABLE message_association(_id INTEGER PRIMARY KEY AUTOINCREMENT,child_message_row_id INTEGER NOT NULL,parent_message_row_id INTEGER NOT NULL,association_type INTEGER NOT NULL);
CREATE TABLE message_logging_funnel_id(message_row_id INTEGER PRIMARY KEY,fs_funnel_id STRING,ps_funnel_id STRING);
CREATE TABLE message_system_biz_callback_enabled(message_row_id INTEGER PRIMARY KEY,callback_expiry_timestamp INTEGER, outgoing_failed_call_id TEXT);
CREATE TABLE media_processed_video(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER,direct_path TEXT,height INTEGER,width INTEGER,file_size INTEGER,bitrate INTEGER,quality INTEGER,capabilities TEXT);
CREATE TABLE reporting_info(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER NOT NULL,reporting_tag BLOB NOT NULL,reporting_token BLOB,reporting_token_content BLOB,reporting_token_version INTEGER,stanza_id STRING,send_timestamp LONG,receive_timestamp LONG, stanza_id_text TEXT, receive_flow INTEGER, is_message_add_on INTEGER);
CREATE TABLE message_system_biz_callback_disabled(message_row_id INTEGER PRIMARY KEY,callback_expiry_timestamp INTEGER, outgoing_failed_call_id TEXT);
CREATE TABLE message_album(message_row_id INTEGER PRIMARY KEY,image_count INTEGER NOT NULL DEFAULT 0,video_count INTEGER NOT NULL DEFAULT 0, expected_image_count INTEGER, expected_video_count INTEGER);
CREATE TABLE message_sticker_pack(message_row_id INTEGER PRIMARY KEY,sticker_pack_id TEXT NOT NULL,tray_icon_file_name TEXT NOT NULL,pack_name TEXT NOT NULL,pack_description TEXT,publisher TEXT, image_data_hash TEXT, sticker_pack_size INTEGER, sticker_pack_origin INTEGER);
CREATE TABLE message_sticker_pack_stickers(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER NOT NULL,file_name TEXT NOT NULL,is_animated INTEGER NOT NULL DEFAULT 0,emojis TEXT,accessibility_label TEXT,is_lottie INTEGER NOT NULL DEFAULT 0,mimetype TEXT);
CREATE TABLE composition(_id INTEGER PRIMARY KEY AUTOINCREMENT,chat_row_id INTEGER NOT NULL,quoted_message_row_id INTEGER,timestamp INTEGER NOT NULL,message_type INTEGER NOT NULL,composition_type INTEGER NOT NULL,text TEXT,lookup_tables INTEGER NOT NULL DEFAULT 0, last_seen_timestamp INTEGER);
CREATE TABLE composition_media(composition_row_id INTEGER PRIMARY KEY NOT NULL,media_uri TEXT,media_duration_in_seconds INTEGER, media_name TEXT, file_length INTEGER);
CREATE TABLE composition_mention(_id INTEGER PRIMARY KEY AUTOINCREMENT,composition_row_id INTEGER NOT NULL,jid_row_id INTEGER NOT NULL, mention_type INTEGER);
CREATE TABLE labels(_id INTEGER PRIMARY KEY AUTOINCREMENT,label_name TEXT,predefined_id INTEGER,color_id INTEGER,sort_id INTEGER NOT NULL DEFAULT 0, type INTEGER NOT NULL DEFAULT 0, hidden INTEGER, mute_end_time INTEGER, mute_schedule_enabled_days INTEGER, mute_schedule_time_from INTEGER, mute_schedule_time_to INTEGER, is_immutable INTEGER);
CREATE TABLE labeled_jid(_id INTEGER PRIMARY KEY AUTOINCREMENT,label_id INTEGER NOT NULL,jid_row_id INTEGER NOT NULL);
CREATE TABLE message_media_interactive_annotation_embedded_music(message_media_interactive_annotation_row_id INTEGER PRIMARY KEY,music_content_media_id TEXT,song_id TEXT,author TEXT,title TEXT,artwork_direct_path TEXT,artwork_sha256 BLOB,artwork_enc_sha256 BLOB,artist_attribution TEXT,country_blocklist BLOB, artwork_media_key BLOB, is_explicit INTEGER, pending_embedded_music_type INTEGER, start_time_ms INTEGER, derived_content_start_time_ms INTEGER, overlap_duration_ms INTEGER, audio_library_product TEXT);
CREATE TABLE message_span_indices(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER,start_index INTEGER,end_index INTEGER,span_type INTEGER);
CREATE TABLE mms_metadata(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER,direct_path TEXT,media_key BLOB,media_key_timestamp INTEGER,enc_thumb_hash TEXT,thumb_hash TEXT,thumb_width INTEGER,thumb_height INTEGER,transferred INTEGER,micro_thumbnail BLOB,insert_timestamp INTEGER,handle TEXT,type INTEGER);
CREATE TABLE bot_memory_metadata(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER NOT NULL,memory_annotated_user_message_key_id TEXT NOT NULL,memory TEXT,memory_id TEXT NOT NULL,added INTEGER NOT NULL, bot_jid_row_id INTEGER);
CREATE VIRTUAL TABLE message_newsletter_fts USING FTS4(content, fts_jid, fts_namespace)
/* message_newsletter_fts(content,fts_jid,fts_namespace) */;
CREATE TABLE IF NOT EXISTS 'message_newsletter_fts_content'(docid INTEGER PRIMARY KEY, 'c0content', 'c1fts_jid', 'c2fts_namespace');
CREATE TABLE IF NOT EXISTS 'message_newsletter_fts_segments'(blockid INTEGER PRIMARY KEY, block BLOB);
CREATE TABLE IF NOT EXISTS 'message_newsletter_fts_segdir'(level INTEGER,idx INTEGER,start_block INTEGER,leaves_end_block INTEGER,end_block INTEGER,root BLOB,PRIMARY KEY(level, idx));
CREATE TABLE IF NOT EXISTS 'message_newsletter_fts_docsize'(docid INTEGER PRIMARY KEY, size BLOB);
CREATE TABLE IF NOT EXISTS 'message_newsletter_fts_stat'(id INTEGER PRIMARY KEY, value BLOB);
CREATE VIRTUAL TABLE message_ftsv2 USING FTS4(content, fts_jid, fts_namespace)
/* message_ftsv2(content,fts_jid,fts_namespace) */;
CREATE TABLE IF NOT EXISTS 'message_ftsv2_content'(docid INTEGER PRIMARY KEY, 'c0content', 'c1fts_jid', 'c2fts_namespace');
CREATE TABLE IF NOT EXISTS 'message_ftsv2_segments'(blockid INTEGER PRIMARY KEY, block BLOB);
CREATE TABLE IF NOT EXISTS 'message_ftsv2_segdir'(level INTEGER,idx INTEGER,start_block INTEGER,leaves_end_block INTEGER,end_block INTEGER,root BLOB,PRIMARY KEY(level, idx));
CREATE TABLE IF NOT EXISTS 'message_ftsv2_docsize'(docid INTEGER PRIMARY KEY, size BLOB);
CREATE TABLE IF NOT EXISTS 'message_ftsv2_stat'(id INTEGER PRIMARY KEY, value BLOB);
CREATE TRIGGER agent_chat_assignment_delete_for_backup_changes_trigger
        AFTER DELETE ON agent_chat_assignment
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'agent_chat_assignment')
  AND
  (table_row_id = OLD.jid_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'agent_chat_assignment', OLD.jid_row_id);
        END;
CREATE TRIGGER agent_chat_assignment_insert_for_backup_changes_trigger
        AFTER INSERT ON agent_chat_assignment
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'agent_chat_assignment')
  AND
  (table_row_id = NEW.jid_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'agent_chat_assignment', NEW.jid_row_id);
        END;
CREATE TRIGGER agent_chat_assignment_update_for_backup_changes_trigger
        AFTER UPDATE ON agent_chat_assignment
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'agent_chat_assignment')
  AND
  (table_row_id = NEW.jid_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'agent_chat_assignment', NEW.jid_row_id);
        END;
CREATE TRIGGER agent_devices_delete_for_backup_changes_trigger
        AFTER DELETE ON agent_devices
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'agent_devices')
  AND
  (table_row_id = OLD.rowid)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'agent_devices', OLD.rowid);
        END;
CREATE TRIGGER agent_devices_insert_for_backup_changes_trigger
        AFTER INSERT ON agent_devices
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'agent_devices')
  AND
  (table_row_id = NEW.rowid)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'agent_devices', NEW.rowid);
        END;
CREATE TRIGGER agent_devices_update_for_backup_changes_trigger
        AFTER UPDATE ON agent_devices
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'agent_devices')
  AND
  (table_row_id = NEW.rowid)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'agent_devices', NEW.rowid);
        END;
CREATE TRIGGER agent_message_attribution_delete_for_backup_changes_trigger
        AFTER DELETE ON agent_message_attribution
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'agent_message_attribution')
  AND
  (table_row_id = OLD.message_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'agent_message_attribution', OLD.message_row_id);
        END;
CREATE TRIGGER agent_message_attribution_insert_for_backup_changes_trigger
        AFTER INSERT ON agent_message_attribution
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'agent_message_attribution')
  AND
  (table_row_id = NEW.message_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'agent_message_attribution', NEW.message_row_id);
        END;
CREATE TRIGGER agent_message_attribution_update_for_backup_changes_trigger
        AFTER UPDATE ON agent_message_attribution
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'agent_message_attribution')
  AND
  (table_row_id = NEW.message_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'agent_message_attribution', NEW.message_row_id);
        END;
CREATE TRIGGER away_messages_delete_for_backup_changes_trigger
        AFTER DELETE ON away_messages
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'away_messages')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'away_messages', OLD._id);
        END;
CREATE TRIGGER away_messages_insert_for_backup_changes_trigger
        AFTER INSERT ON away_messages
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'away_messages')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'away_messages', NEW._id);
        END;
CREATE TRIGGER away_messages_update_for_backup_changes_trigger
        AFTER UPDATE ON away_messages
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'away_messages')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'away_messages', NEW._id);
        END;
CREATE TRIGGER bot_memory_metadata_delete_for_backup_changes_trigger
        AFTER DELETE ON bot_memory_metadata
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'bot_memory_metadata')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'bot_memory_metadata', OLD._id);
        END;
CREATE TRIGGER bot_memory_metadata_insert_for_backup_changes_trigger
        AFTER INSERT ON bot_memory_metadata
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'bot_memory_metadata')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'bot_memory_metadata', NEW._id);
        END;
CREATE TRIGGER bot_memory_metadata_update_for_backup_changes_trigger
        AFTER UPDATE ON bot_memory_metadata
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'bot_memory_metadata')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'bot_memory_metadata', NEW._id);
        END;
CREATE TRIGGER call_link_delete_for_backup_changes_trigger
        AFTER DELETE ON call_link
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'call_link')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'call_link', OLD._id);
        END;
CREATE TRIGGER call_link_insert_for_backup_changes_trigger
        AFTER INSERT ON call_link
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'call_link')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'call_link', NEW._id);
        END;
CREATE TRIGGER call_link_update_for_backup_changes_trigger
        AFTER UPDATE ON call_link
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'call_link')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'call_link', NEW._id);
        END;
CREATE TRIGGER call_log_bd_for_call_log_participant_v2_trigger BEFORE DELETE ON call_log BEGIN DELETE FROM call_log_participant_v2 WHERE call_log_row_id = old._id; END;
CREATE TRIGGER call_log_bd_for_call_unknown_caller_trigger BEFORE DELETE ON call_log BEGIN DELETE FROM call_unknown_caller WHERE call_log_row_id=OLD._id; END;
CREATE TRIGGER call_log_bd_for_joinable_call_log_trigger BEFORE DELETE ON call_log BEGIN DELETE FROM joinable_call_log WHERE call_log_row_id=old._id; END;
CREATE TRIGGER call_log_delete_for_backup_changes_trigger
        AFTER DELETE ON call_log
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'call_log')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'call_log', OLD._id);
        END;
CREATE TRIGGER call_log_insert_for_backup_changes_trigger
        AFTER INSERT ON call_log
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'call_log')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'call_log', NEW._id);
        END;
CREATE TRIGGER call_log_participant_v2_delete_for_backup_changes_trigger
        AFTER DELETE ON call_log_participant_v2
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'call_log_participant_v2')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'call_log_participant_v2', OLD._id);
        END;
CREATE TRIGGER call_log_participant_v2_insert_for_backup_changes_trigger
        AFTER INSERT ON call_log_participant_v2
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'call_log_participant_v2')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'call_log_participant_v2', NEW._id);
        END;
CREATE TRIGGER call_log_participant_v2_update_for_backup_changes_trigger
        AFTER UPDATE ON call_log_participant_v2
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'call_log_participant_v2')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'call_log_participant_v2', NEW._id);
        END;
CREATE TRIGGER call_log_update_for_backup_changes_trigger
        AFTER UPDATE ON call_log
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'call_log')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'call_log', NEW._id);
        END;
CREATE TRIGGER chat_bd_for_bot_chat_info_trigger BEFORE DELETE ON chat BEGIN DELETE FROM bot_chat_info WHERE chat_row_id = old._id; END;
CREATE TRIGGER chat_bd_for_chat_ephemeral_trigger BEFORE DELETE ON chat BEGIN DELETE FROM chat_ephemeral WHERE chat_row_id=old._id; END;
CREATE TRIGGER chat_bd_for_community_chat_trigger BEFORE DELETE ON chat BEGIN DELETE FROM community_chat WHERE chat_row_id=old._id; END;
CREATE TRIGGER chat_bd_for_composition_trigger BEFORE DELETE ON chat BEGIN DELETE FROM composition WHERE chat_row_id=old._id; END;
CREATE TRIGGER chat_bd_for_message_link_trigger BEFORE DELETE ON chat BEGIN DELETE FROM message_link WHERE chat_row_id=old._id; END;
CREATE TRIGGER chat_bd_for_message_orphan_trigger BEFORE DELETE ON chat BEGIN DELETE FROM message_orphan WHERE parent_chat_row_id=old._id; END;
CREATE TRIGGER chat_bd_for_newsletter_linked_account_trigger BEFORE DELETE ON chat BEGIN DELETE FROM newsletter_linked_account WHERE chat_row_id=old._id; END;
CREATE TRIGGER chat_bd_for_newsletter_trigger BEFORE DELETE ON chat BEGIN DELETE FROM newsletter WHERE chat_row_id=old._id; END;
CREATE TRIGGER chat_delete_for_backup_changes_trigger
        AFTER DELETE ON chat
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'chat')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'chat', OLD._id);
        END;
CREATE TRIGGER chat_insert_for_backup_changes_trigger
        AFTER INSERT ON chat
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'chat')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'chat', NEW._id);
        END;
CREATE TRIGGER chat_update_for_backup_changes_trigger
        AFTER UPDATE ON chat
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'chat')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'chat', NEW._id);
        END;
CREATE TRIGGER community_chat_delete_for_backup_changes_trigger
        AFTER DELETE ON community_chat
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'community_chat')
  AND
  (table_row_id = OLD.chat_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'community_chat', OLD.chat_row_id);
        END;
CREATE TRIGGER community_chat_insert_for_backup_changes_trigger
        AFTER INSERT ON community_chat
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'community_chat')
  AND
  (table_row_id = NEW.chat_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'community_chat', NEW.chat_row_id);
        END;
CREATE TRIGGER community_chat_update_for_backup_changes_trigger
        AFTER UPDATE ON community_chat
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'community_chat')
  AND
  (table_row_id = NEW.chat_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'community_chat', NEW.chat_row_id);
        END;
CREATE TRIGGER composition_bd_for_composition_media_trigger BEFORE DELETE ON composition BEGIN DELETE FROM composition_media WHERE composition_row_id=old._id; END;
CREATE TRIGGER composition_bd_for_composition_mention_trigger BEFORE DELETE ON composition BEGIN DELETE FROM composition_mention WHERE composition_row_id=old._id; END;
CREATE TRIGGER frequent_delete_for_backup_changes_trigger
        AFTER DELETE ON frequent
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'frequent')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'frequent', OLD._id);
        END;
CREATE TRIGGER frequent_insert_for_backup_changes_trigger
        AFTER INSERT ON frequent
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'frequent')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'frequent', NEW._id);
        END;
CREATE TRIGGER frequent_update_for_backup_changes_trigger
        AFTER UPDATE ON frequent
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'frequent')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'frequent', NEW._id);
        END;
CREATE TRIGGER group_notification_version_delete_for_backup_changes_trigger
        AFTER DELETE ON group_notification_version
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'group_notification_version')
  AND
  (table_row_id = OLD.group_jid_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'group_notification_version', OLD.group_jid_row_id);
        END;
CREATE TRIGGER group_notification_version_insert_for_backup_changes_trigger
        AFTER INSERT ON group_notification_version
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'group_notification_version')
  AND
  (table_row_id = NEW.group_jid_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'group_notification_version', NEW.group_jid_row_id);
        END;
CREATE TRIGGER group_notification_version_update_for_backup_changes_trigger
        AFTER UPDATE ON group_notification_version
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'group_notification_version')
  AND
  (table_row_id = NEW.group_jid_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'group_notification_version', NEW.group_jid_row_id);
        END;
CREATE TRIGGER group_participant_device_delete_for_backup_changes_trigger
        AFTER DELETE ON group_participant_device
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'group_participant_device')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'group_participant_device', OLD._id);
        END;
CREATE TRIGGER group_participant_device_insert_for_backup_changes_trigger
        AFTER INSERT ON group_participant_device
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'group_participant_device')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'group_participant_device', NEW._id);
        END;
CREATE TRIGGER group_participant_device_update_for_backup_changes_trigger
        AFTER UPDATE ON group_participant_device
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'group_participant_device')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'group_participant_device', NEW._id);
        END;
CREATE TRIGGER group_participant_user_bd_for_group_participant_device_trigger BEFORE DELETE ON group_participant_user BEGIN DELETE FROM group_participant_device WHERE group_participant_row_id=old._id; END;
CREATE TRIGGER group_participant_user_delete_for_backup_changes_trigger
        AFTER DELETE ON group_participant_user
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'group_participant_user')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'group_participant_user', OLD._id);
        END;
CREATE TRIGGER group_participant_user_insert_for_backup_changes_trigger
        AFTER INSERT ON group_participant_user
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'group_participant_user')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'group_participant_user', NEW._id);
        END;
CREATE TRIGGER group_participant_user_update_for_backup_changes_trigger
        AFTER UPDATE ON group_participant_user
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'group_participant_user')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'group_participant_user', NEW._id);
        END;
CREATE TRIGGER group_past_participant_user_delete_for_backup_changes_trigger
        AFTER DELETE ON group_past_participant_user
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'group_past_participant_user')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'group_past_participant_user', OLD._id);
        END;
CREATE TRIGGER group_past_participant_user_insert_for_backup_changes_trigger
        AFTER INSERT ON group_past_participant_user
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'group_past_participant_user')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'group_past_participant_user', NEW._id);
        END;
CREATE TRIGGER group_past_participant_user_update_for_backup_changes_trigger
        AFTER UPDATE ON group_past_participant_user
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'group_past_participant_user')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'group_past_participant_user', NEW._id);
        END;
CREATE TRIGGER jid_delete_for_backup_changes_trigger
        AFTER DELETE ON jid
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'jid')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'jid', OLD._id);
        END;
CREATE TRIGGER jid_insert_for_backup_changes_trigger
        AFTER INSERT ON jid
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'jid')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'jid', NEW._id);
        END;
CREATE TRIGGER jid_update_for_backup_changes_trigger
        AFTER UPDATE ON jid
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'jid')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'jid', NEW._id);
        END;
CREATE TRIGGER joinable_call_log_delete_for_backup_changes_trigger
        AFTER DELETE ON joinable_call_log
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'joinable_call_log')
  AND
  (table_row_id = OLD.call_log_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'joinable_call_log', OLD.call_log_row_id);
        END;
CREATE TRIGGER joinable_call_log_insert_for_backup_changes_trigger
        AFTER INSERT ON joinable_call_log
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'joinable_call_log')
  AND
  (table_row_id = NEW.call_log_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'joinable_call_log', NEW.call_log_row_id);
        END;
CREATE TRIGGER joinable_call_log_update_for_backup_changes_trigger
        AFTER UPDATE ON joinable_call_log
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'joinable_call_log')
  AND
  (table_row_id = NEW.call_log_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'joinable_call_log', NEW.call_log_row_id);
        END;
CREATE TRIGGER keywords_delete_for_backup_changes_trigger
        AFTER DELETE ON keywords
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'keywords')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'keywords', OLD._id);
        END;
CREATE TRIGGER keywords_insert_for_backup_changes_trigger
        AFTER INSERT ON keywords
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'keywords')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'keywords', NEW._id);
        END;
CREATE TRIGGER keywords_update_for_backup_changes_trigger
        AFTER UPDATE ON keywords
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'keywords')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'keywords', NEW._id);
        END;
CREATE TRIGGER labeled_jid_delete_for_backup_changes_trigger
        AFTER DELETE ON labeled_jid
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'labeled_jid')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'labeled_jid', OLD._id);
        END;
CREATE TRIGGER labeled_jid_insert_for_backup_changes_trigger
        AFTER INSERT ON labeled_jid
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'labeled_jid')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'labeled_jid', NEW._id);
        END;
CREATE TRIGGER labeled_jid_update_for_backup_changes_trigger
        AFTER UPDATE ON labeled_jid
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'labeled_jid')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'labeled_jid', NEW._id);
        END;
CREATE TRIGGER labels_bd_for_labeled_jid_trigger BEFORE DELETE ON labels BEGIN DELETE FROM labeled_jid WHERE label_id=old._id; END;
CREATE TRIGGER labels_delete_for_backup_changes_trigger
        AFTER DELETE ON labels
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'labels')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'labels', OLD._id);
        END;
CREATE TRIGGER labels_insert_for_backup_changes_trigger
        AFTER INSERT ON labels
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'labels')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'labels', NEW._id);
        END;
CREATE TRIGGER labels_update_for_backup_changes_trigger
        AFTER UPDATE ON labels
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'labels')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'labels', NEW._id);
        END;
CREATE TRIGGER lid_chat_state_delete_for_backup_changes_trigger
        AFTER DELETE ON lid_chat_state
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'lid_chat_state')
  AND
  (table_row_id = OLD.jid_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'lid_chat_state', OLD.jid_row_id);
        END;
CREATE TRIGGER lid_chat_state_insert_for_backup_changes_trigger
        AFTER INSERT ON lid_chat_state
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'lid_chat_state')
  AND
  (table_row_id = NEW.jid_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'lid_chat_state', NEW.jid_row_id);
        END;
CREATE TRIGGER lid_chat_state_update_for_backup_changes_trigger
        AFTER UPDATE ON lid_chat_state
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'lid_chat_state')
  AND
  (table_row_id = NEW.jid_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'lid_chat_state', NEW.jid_row_id);
        END;
CREATE TRIGGER lid_display_name_delete_for_backup_changes_trigger
        AFTER DELETE ON lid_display_name
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'lid_display_name')
  AND
  (table_row_id = OLD.lid_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'lid_display_name', OLD.lid_row_id);
        END;
CREATE TRIGGER lid_display_name_insert_for_backup_changes_trigger
        AFTER INSERT ON lid_display_name
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'lid_display_name')
  AND
  (table_row_id = NEW.lid_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'lid_display_name', NEW.lid_row_id);
        END;
CREATE TRIGGER lid_display_name_update_for_backup_changes_trigger
        AFTER UPDATE ON lid_display_name
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'lid_display_name')
  AND
  (table_row_id = NEW.lid_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'lid_display_name', NEW.lid_row_id);
        END;
CREATE TRIGGER media_refs_delete_for_backup_changes_trigger
        AFTER DELETE ON media_refs
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'media_refs')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'media_refs', OLD._id);
        END;
CREATE TRIGGER media_refs_insert_for_backup_changes_trigger
        AFTER INSERT ON media_refs
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'media_refs')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'media_refs', NEW._id);
        END;
CREATE TRIGGER media_refs_update_for_backup_changes_trigger
        AFTER UPDATE ON media_refs
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'media_refs')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'media_refs', NEW._id);
        END;
CREATE TRIGGER message_add_on_bd_for_message_add_on_event_response_trigger BEFORE DELETE ON message_add_on BEGIN DELETE FROM message_add_on_event_response WHERE message_add_on_row_id=old._id; END;
CREATE TRIGGER message_add_on_bd_for_message_add_on_keep_in_chat_trigger BEFORE DELETE ON message_add_on BEGIN DELETE FROM message_add_on_keep_in_chat WHERE message_add_on_row_id=old._id; END;
CREATE TRIGGER message_add_on_bd_for_message_add_on_pin_in_chat_trigger BEFORE DELETE ON message_add_on BEGIN DELETE FROM message_add_on_pin_in_chat WHERE message_add_on_row_id=old._id; END;
CREATE TRIGGER message_add_on_bd_for_message_add_on_poll_vote_selected_option_trigger BEFORE DELETE ON message_add_on BEGIN DELETE FROM message_add_on_poll_vote_selected_option WHERE message_add_on_row_id=old._id; END;
CREATE TRIGGER message_add_on_bd_for_message_add_on_poll_vote_trigger BEFORE DELETE ON message_add_on BEGIN DELETE FROM message_add_on_poll_vote WHERE message_add_on_row_id=old._id; END;
CREATE TRIGGER message_add_on_bd_for_message_add_on_reaction_trigger BEFORE DELETE ON message_add_on BEGIN DELETE FROM message_add_on_reaction WHERE message_add_on_row_id=old._id; END;
CREATE TRIGGER message_add_on_bd_for_message_add_on_receipt_device_trigger BEFORE DELETE ON message_add_on BEGIN DELETE FROM message_add_on_receipt_device WHERE message_add_on_row_id=old._id; END;
CREATE TRIGGER message_add_on_bd_for_message_add_on_scheduled_call_edit_trigger BEFORE DELETE ON message_add_on BEGIN DELETE FROM message_add_on_scheduled_call_edit WHERE message_add_on_row_id=old._id; END;
CREATE TRIGGER message_add_on_delete_for_backup_changes_trigger
      AFTER DELETE ON message_add_on
      BEGIN
        DELETE FROM 
  backup_changes
WHERE
  (table_name = 'message') 
  AND
  (table_row_id = OLD.parent_message_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
        INSERT INTO 
  backup_changes (operation, table_name, table_row_id)
VALUES ('DELETE', 'message', OLD.parent_message_row_id);
      END;
CREATE TRIGGER message_add_on_insert_for_backup_changes_trigger
      AFTER INSERT ON message_add_on
      BEGIN
        DELETE FROM 
  backup_changes
WHERE
  (table_name = 'message') 
  AND
  (table_row_id = NEW.parent_message_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
        INSERT INTO 
  backup_changes (operation, table_name, table_row_id)
VALUES ('INSERT', 'message', NEW.parent_message_row_id);
      END;
CREATE TRIGGER message_add_on_receipt_device_delete_for_backup_changes_trigger
        AFTER DELETE ON message_add_on_receipt_device
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'message_add_on_receipt_device')
  AND
  (table_row_id = OLD.receipt_device_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'message_add_on_receipt_device', OLD.receipt_device_id);
        END;
CREATE TRIGGER message_add_on_receipt_device_insert_for_backup_changes_trigger
        AFTER INSERT ON message_add_on_receipt_device
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'message_add_on_receipt_device')
  AND
  (table_row_id = NEW.receipt_device_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'message_add_on_receipt_device', NEW.receipt_device_id);
        END;
CREATE TRIGGER message_add_on_receipt_device_update_for_backup_changes_trigger
        AFTER UPDATE ON message_add_on_receipt_device
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'message_add_on_receipt_device')
  AND
  (table_row_id = NEW.receipt_device_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'message_add_on_receipt_device', NEW.receipt_device_id);
        END;
CREATE TRIGGER message_add_on_update_for_backup_changes_trigger
      AFTER UPDATE ON message_add_on
      BEGIN
        DELETE FROM 
  backup_changes
WHERE
  (table_name = 'message') 
  AND
  (table_row_id = NEW.parent_message_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
        INSERT INTO 
  backup_changes (operation, table_name, table_row_id)
VALUES ('UPDATE', 'message', NEW.parent_message_row_id);
      END;
CREATE TRIGGER message_bd_for_addon_message_media_trigger BEFORE DELETE ON message BEGIN DELETE FROM addon_message_media WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_agent_message_attribution_trigger BEFORE DELETE ON message BEGIN DELETE FROM agent_message_attribution WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_audio_data_trigger BEFORE DELETE ON message BEGIN DELETE FROM audio_data WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_bot_memory_metadata_trigger BEFORE DELETE ON message BEGIN DELETE FROM bot_memory_metadata WHERE memory_annotated_user_message_key_id = old.key_id OR message_row_id = old._id; END;
CREATE TRIGGER message_bd_for_bot_message_info_trigger BEFORE DELETE ON message BEGIN DELETE FROM bot_message_info WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_bot_message_prompts_trigger BEFORE DELETE ON message BEGIN DELETE FROM bot_message_prompts WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_bot_plugin_metadata_trigger BEFORE DELETE ON message BEGIN DELETE FROM bot_plugin_metadata WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_business_message_forward_info_trigger BEFORE DELETE ON message BEGIN DELETE FROM business_message_forward_info WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_child_message_association_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_association WHERE child_message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_data_sharing_disclosure_metadata_trigger BEFORE DELETE ON message BEGIN DELETE FROM data_sharing_disclosure_metadata WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_forwarded_newsletter_message_info_trigger BEFORE DELETE ON message BEGIN DELETE FROM forwarded_newsletter_message_info WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_add_on_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_add_on WHERE parent_message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_album_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_album WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_bcall_session_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_bcall_session WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_bot_feedback_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_bot_feedback WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_broadcast_ephemeral_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_broadcast_ephemeral WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_call_log_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_call_log WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_comment_parent_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_comment_parent WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_comment_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_comment WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_details_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_details WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_edit_info_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_edit_info WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_ephemeral_setting_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_ephemeral_setting WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_ephemeral_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_ephemeral WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_event_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_event WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_external_ad_content_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_external_ad_content WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_fixed_content_placeholder_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_fixed_content_placeholder WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_forwarded_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_forwarded WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_ftsv2_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_ftsv2 WHERE docid=old._id; END;
CREATE TRIGGER message_bd_for_message_future_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_future WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_group_invite_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_group_invite WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_link_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_link WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_location_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_location WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_logging_funnel_id_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_logging_funnel_id WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_media_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_media WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_mentions_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_mentions WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_newsletter_admin_invite_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_newsletter_admin_invite WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_newsletter_fts_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_newsletter_fts WHERE docid=old._id; END;
CREATE TRIGGER message_bd_for_message_order_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_order WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_parent_association_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_parent_association WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_payment_invite_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_payment_invite WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_poll_option_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_poll_option WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_poll_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_poll WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_privacy_state_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_privacy_state WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_product_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_product WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_quoted_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_quoted WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_rating_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_rating WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_revoked_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_revoked WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_scheduled_call_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_scheduled_call WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_secret_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_secret WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_send_count_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_send_count WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_span_indices_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_span_indices WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_status_psa_campaign_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_status_psa_campaign WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_sticker_pack_stickers_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_sticker_pack_stickers WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_sticker_pack_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_sticker_pack WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_streaming_sidecar_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_streaming_sidecar WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_system_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_system WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_template_button_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_template_button WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_template_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_template WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_text_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_text WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_thumbnail_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_thumbnail WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_translation_request_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_translation_request WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_ui_elements_reply_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_ui_elements_reply WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_ui_elements_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_ui_elements WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_vcard_jid_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_vcard_jid WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_vcard_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_vcard WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_view_once_media_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_view_once_media WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_messages_hydrated_four_row_template_trigger BEFORE DELETE ON message BEGIN DELETE FROM messages_hydrated_four_row_template WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_missed_call_logs_trigger BEFORE DELETE ON message BEGIN DELETE FROM missed_call_logs WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_mms_metadata_trigger BEFORE DELETE ON message BEGIN DELETE FROM mms_metadata WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_mms_thumbnail_metadata_trigger BEFORE DELETE ON message BEGIN DELETE FROM mms_thumbnail_metadata WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_newsletter_message_enforcements_trigger BEFORE DELETE ON message BEGIN DELETE FROM newsletter_message_enforcements WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_newsletter_message_reaction_trigger BEFORE DELETE ON message BEGIN DELETE FROM newsletter_message_reaction WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_newsletter_message_trigger BEFORE DELETE ON message BEGIN DELETE FROM newsletter_message WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_parent_message_association_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_association WHERE parent_message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_played_self_receipt_trigger BEFORE DELETE ON message BEGIN DELETE FROM played_self_receipt WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_premium_message_info_trigger BEFORE DELETE ON message BEGIN DELETE FROM premium_message_info WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_receipt_device_trigger BEFORE DELETE ON message BEGIN DELETE FROM receipt_device WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_receipt_user_trigger BEFORE DELETE ON message BEGIN DELETE FROM receipt_user WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_reporting_info_trigger BEFORE DELETE ON message BEGIN DELETE FROM reporting_info WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_scheduled_reminder_message_trigger BEFORE DELETE ON message BEGIN DELETE FROM scheduled_reminder_message WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_status_crossposting_trigger BEFORE DELETE ON message BEGIN DELETE FROM status_crossposting WHERE status_message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_status_crossposting_v3_trigger BEFORE DELETE ON message BEGIN DELETE FROM status_crossposting_v3 WHERE status_message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_status_message_info_trigger BEFORE DELETE ON message BEGIN DELETE FROM status_message_info WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_suggest_as_you_type_trigger BEFORE DELETE ON message BEGIN DELETE FROM suggest_as_you_type WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_suggested_replies_trigger BEFORE DELETE ON message BEGIN DELETE FROM suggested_replies WHERE message_row_id=old._id OR customer_message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_transcription_segment_trigger BEFORE DELETE ON message BEGIN DELETE FROM transcription_segment WHERE message_row_id=old._id; END;
CREATE TRIGGER message_delete_for_backup_changes_trigger
        AFTER DELETE ON message
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'message')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'message', OLD._id);
        END;
CREATE TRIGGER message_insert_for_backup_changes_trigger
        AFTER INSERT ON message
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'message')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'message', NEW._id);
        END;
CREATE TRIGGER message_media_bd_for_media_processed_video_trigger BEFORE DELETE ON message_media BEGIN DELETE FROM media_processed_video WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_media_bd_for_message_media_interactive_annotation_trigger BEFORE DELETE ON message_media BEGIN DELETE FROM message_media_interactive_annotation WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_media_bd_for_message_media_vcard_count_trigger BEFORE DELETE ON message_media BEGIN DELETE FROM message_media_vcard_count WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_media_interactive_annotation_bd_for_message_media_interactive_annotation_embedded_music_trigger BEFORE DELETE ON message_media_interactive_annotation BEGIN DELETE FROM message_media_interactive_annotation_embedded_music WHERE message_media_interactive_annotation_row_id=old._id; END;
CREATE TRIGGER message_media_interactive_annotation_bd_for_message_media_interactive_annotation_vertex_trigger BEFORE DELETE ON message_media_interactive_annotation BEGIN DELETE FROM message_media_interactive_annotation_vertex WHERE message_media_interactive_annotation_row_id=old._id; END;
CREATE TRIGGER message_poll_bd_for_message_poll_option_trigger BEFORE DELETE ON message_poll BEGIN DELETE FROM message_poll_option WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_quoted_bd_for_message_quoted_blank_reply_trigger BEFORE DELETE ON message_quoted BEGIN DELETE FROM message_quoted_blank_reply WHERE message_row_id = old.message_row_id; END;
CREATE TRIGGER message_quoted_bd_for_message_quoted_call_log_trigger BEFORE DELETE ON message_quoted BEGIN DELETE FROM message_quoted_call_log WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_quoted_bd_for_message_quoted_group_invite_trigger BEFORE DELETE ON message_quoted BEGIN DELETE FROM message_quoted_group_invite WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_quoted_bd_for_message_quoted_location_trigger BEFORE DELETE ON message_quoted BEGIN DELETE FROM message_quoted_location WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_quoted_bd_for_message_quoted_media_trigger BEFORE DELETE ON message_quoted BEGIN DELETE FROM message_quoted_media WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_quoted_bd_for_message_quoted_mentions_trigger BEFORE DELETE ON message_quoted BEGIN DELETE FROM message_quoted_mentions WHERE message_row_id = old.message_row_id; END;
CREATE TRIGGER message_quoted_bd_for_message_quoted_order_trigger BEFORE DELETE ON message_quoted BEGIN DELETE FROM message_quoted_order WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_quoted_bd_for_message_quoted_payment_invite_trigger BEFORE DELETE ON message_quoted BEGIN DELETE FROM message_quoted_payment_invite WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_quoted_bd_for_message_quoted_product_trigger BEFORE DELETE ON message_quoted BEGIN DELETE FROM message_quoted_product WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_quoted_bd_for_message_quoted_text_trigger BEFORE DELETE ON message_quoted BEGIN DELETE FROM message_quoted_text WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_quoted_bd_for_message_quoted_ui_elements_reply_trigger BEFORE DELETE ON message_quoted BEGIN DELETE FROM message_quoted_ui_elements_reply WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_quoted_bd_for_message_quoted_ui_elements_trigger BEFORE DELETE ON message_quoted BEGIN DELETE FROM message_quoted_ui_elements WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_quoted_bd_for_message_quoted_vcard_trigger BEFORE DELETE ON message_quoted BEGIN DELETE FROM message_quoted_vcard WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_quoted_bd_for_message_template_quoted_trigger BEFORE DELETE ON message_quoted BEGIN DELETE FROM message_template_quoted WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_payment_status_update_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_payment_status_update WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_payment_transaction_reminder_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_payment_transaction_reminder WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_payment_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_payment WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_biz_callback_disabled_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_biz_callback_disabled WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_biz_callback_enabled_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_biz_callback_enabled WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_block_contact_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_block_contact WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_business_state_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_business_state WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_chat_assignment_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_chat_assignment WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_chat_participant_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_chat_participant WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_community_link_changed_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_community_link_changed WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_device_change_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_device_change WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_ephemeral_setting_not_applied_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_ephemeral_setting_not_applied WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_event_updates_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_event_updates WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_group_auto_restrict_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_group_auto_restrict WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_group_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_group WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_group_with_parent_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_group_with_parent WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_initial_privacy_provider_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_initial_privacy_provider WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_linked_group_call_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_linked_group_call WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_number_change_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_number_change WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_opt_out_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_opt_out WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_payment_invite_setup_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_payment_invite_setup WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_photo_change_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_photo_change WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_reminder_sent_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_reminder_sent WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_reminder_setup_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_reminder_setup WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_scheduled_call_start_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_scheduled_call_start WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_sibling_group_link_change_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_sibling_group_link_change WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_value_change_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_value_change WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_system_bd_for_message_system_with_group_nodes_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_with_group_nodes WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_template_bd_for_message_template_button_trigger BEFORE DELETE ON message_template BEGIN DELETE FROM message_template_button WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER message_update_for_backup_changes_trigger
        AFTER UPDATE ON message
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'message')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'message', NEW._id);
        END;
CREATE TRIGGER message_vcard_bd_for_message_vcard_jid_trigger BEFORE DELETE ON message_vcard BEGIN DELETE FROM message_vcard_jid WHERE vcard_row_id=old._id; END;
CREATE TRIGGER missed_call_logs_bd_for_missed_call_log_participant_trigger BEFORE DELETE ON missed_call_logs BEGIN DELETE FROM missed_call_log_participant WHERE call_logs_row_id=old._id; END;
CREATE TRIGGER newsletter_bd_for_newsletter_subscribers_trigger BEFORE DELETE ON newsletter BEGIN DELETE FROM newsletter_subscribers WHERE chat_row_id=old.chat_row_id; END;
CREATE TRIGGER parent_group_participants_delete_for_backup_changes_trigger
        AFTER DELETE ON parent_group_participants
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'parent_group_participants')
  AND
  (table_row_id = OLD.rowid)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'parent_group_participants', OLD.rowid);
        END;
CREATE TRIGGER parent_group_participants_insert_for_backup_changes_trigger
        AFTER INSERT ON parent_group_participants
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'parent_group_participants')
  AND
  (table_row_id = NEW.rowid)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'parent_group_participants', NEW.rowid);
        END;
CREATE TRIGGER parent_group_participants_update_for_backup_changes_trigger
        AFTER UPDATE ON parent_group_participants
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'parent_group_participants')
  AND
  (table_row_id = NEW.rowid)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'parent_group_participants', NEW.rowid);
        END;
CREATE TRIGGER pay_transaction_delete_for_backup_changes_trigger
        AFTER DELETE ON pay_transaction
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'pay_transaction')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'pay_transaction', OLD._id);
        END;
CREATE TRIGGER pay_transaction_insert_for_backup_changes_trigger
        AFTER INSERT ON pay_transaction
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'pay_transaction')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'pay_transaction', NEW._id);
        END;
CREATE TRIGGER pay_transaction_update_for_backup_changes_trigger
        AFTER UPDATE ON pay_transaction
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'pay_transaction')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'pay_transaction', NEW._id);
        END;
CREATE TRIGGER payment_background_bd_for_payment_background_order_trigger BEFORE DELETE ON payment_background BEGIN DELETE FROM payment_background_order WHERE background_id=old.background_id; END;
CREATE TRIGGER payment_background_delete_for_backup_changes_trigger
        AFTER DELETE ON payment_background
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'payment_background')
  AND
  (table_row_id = OLD.rowid)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'payment_background', OLD.rowid);
        END;
CREATE TRIGGER payment_background_insert_for_backup_changes_trigger
        AFTER INSERT ON payment_background
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'payment_background')
  AND
  (table_row_id = NEW.rowid)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'payment_background', NEW.rowid);
        END;
CREATE TRIGGER payment_background_order_delete_for_backup_changes_trigger
        AFTER DELETE ON payment_background_order
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'payment_background_order')
  AND
  (table_row_id = OLD.rowid)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'payment_background_order', OLD.rowid);
        END;
CREATE TRIGGER payment_background_order_insert_for_backup_changes_trigger
        AFTER INSERT ON payment_background_order
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'payment_background_order')
  AND
  (table_row_id = NEW.rowid)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'payment_background_order', NEW.rowid);
        END;
CREATE TRIGGER payment_background_order_update_for_backup_changes_trigger
        AFTER UPDATE ON payment_background_order
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'payment_background_order')
  AND
  (table_row_id = NEW.rowid)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'payment_background_order', NEW.rowid);
        END;
CREATE TRIGGER payment_background_update_for_backup_changes_trigger
        AFTER UPDATE ON payment_background
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'payment_background')
  AND
  (table_row_id = NEW.rowid)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'payment_background', NEW.rowid);
        END;
CREATE TRIGGER played_self_receipt_delete_for_backup_changes_trigger
        AFTER DELETE ON played_self_receipt
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'played_self_receipt')
  AND
  (table_row_id = OLD.message_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'played_self_receipt', OLD.message_row_id);
        END;
CREATE TRIGGER played_self_receipt_insert_for_backup_changes_trigger
        AFTER INSERT ON played_self_receipt
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'played_self_receipt')
  AND
  (table_row_id = NEW.message_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'played_self_receipt', NEW.message_row_id);
        END;
CREATE TRIGGER played_self_receipt_update_for_backup_changes_trigger
        AFTER UPDATE ON played_self_receipt
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'played_self_receipt')
  AND
  (table_row_id = NEW.message_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'played_self_receipt', NEW.message_row_id);
        END;
CREATE TRIGGER primary_device_version_delete_for_backup_changes_trigger
        AFTER DELETE ON primary_device_version
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'primary_device_version')
  AND
  (table_row_id = OLD.user_jid_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'primary_device_version', OLD.user_jid_row_id);
        END;
CREATE TRIGGER primary_device_version_insert_for_backup_changes_trigger
        AFTER INSERT ON primary_device_version
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'primary_device_version')
  AND
  (table_row_id = NEW.user_jid_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'primary_device_version', NEW.user_jid_row_id);
        END;
CREATE TRIGGER primary_device_version_update_for_backup_changes_trigger
        AFTER UPDATE ON primary_device_version
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'primary_device_version')
  AND
  (table_row_id = NEW.user_jid_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'primary_device_version', NEW.user_jid_row_id);
        END;
CREATE TRIGGER props_delete_for_backup_changes_trigger
        AFTER DELETE ON props
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'props')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'props', OLD._id);
        END;
CREATE TRIGGER props_insert_for_backup_changes_trigger
        AFTER INSERT ON props
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'props')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'props', NEW._id);
        END;
CREATE TRIGGER props_update_for_backup_changes_trigger
        AFTER UPDATE ON props
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'props')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'props', NEW._id);
        END;
CREATE TRIGGER quick_replies_bd_for_quick_reply_attachments_trigger BEFORE DELETE ON quick_replies BEGIN DELETE FROM quick_reply_attachments WHERE quick_reply_id=old._id; END;
CREATE TRIGGER quick_replies_bd_for_quick_reply_keywords_trigger BEFORE DELETE ON quick_replies BEGIN DELETE FROM quick_reply_keywords WHERE quick_reply_id=old._id; END;
CREATE TRIGGER quick_replies_bd_for_quick_reply_usage_trigger BEFORE DELETE ON quick_replies BEGIN DELETE FROM quick_reply_usage WHERE quick_reply_id=old._id; END;
CREATE TRIGGER quick_replies_delete_for_backup_changes_trigger
        AFTER DELETE ON quick_replies
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'quick_replies')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'quick_replies', OLD._id);
        END;
CREATE TRIGGER quick_replies_insert_for_backup_changes_trigger
        AFTER INSERT ON quick_replies
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'quick_replies')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'quick_replies', NEW._id);
        END;
CREATE TRIGGER quick_replies_update_for_backup_changes_trigger
        AFTER UPDATE ON quick_replies
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'quick_replies')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'quick_replies', NEW._id);
        END;
CREATE TRIGGER quick_reply_attachments_delete_for_backup_changes_trigger
        AFTER DELETE ON quick_reply_attachments
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'quick_reply_attachments')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'quick_reply_attachments', OLD._id);
        END;
CREATE TRIGGER quick_reply_attachments_insert_for_backup_changes_trigger
        AFTER INSERT ON quick_reply_attachments
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'quick_reply_attachments')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'quick_reply_attachments', NEW._id);
        END;
CREATE TRIGGER quick_reply_attachments_update_for_backup_changes_trigger
        AFTER UPDATE ON quick_reply_attachments
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'quick_reply_attachments')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'quick_reply_attachments', NEW._id);
        END;
CREATE TRIGGER quick_reply_keywords_delete_for_backup_changes_trigger
        AFTER DELETE ON quick_reply_keywords
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'quick_reply_keywords')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'quick_reply_keywords', OLD._id);
        END;
CREATE TRIGGER quick_reply_keywords_insert_for_backup_changes_trigger
        AFTER INSERT ON quick_reply_keywords
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'quick_reply_keywords')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'quick_reply_keywords', NEW._id);
        END;
CREATE TRIGGER quick_reply_keywords_update_for_backup_changes_trigger
        AFTER UPDATE ON quick_reply_keywords
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'quick_reply_keywords')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'quick_reply_keywords', NEW._id);
        END;
CREATE TRIGGER quick_reply_usage_delete_for_backup_changes_trigger
        AFTER DELETE ON quick_reply_usage
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'quick_reply_usage')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'quick_reply_usage', OLD._id);
        END;
CREATE TRIGGER quick_reply_usage_insert_for_backup_changes_trigger
        AFTER INSERT ON quick_reply_usage
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'quick_reply_usage')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'quick_reply_usage', NEW._id);
        END;
CREATE TRIGGER quick_reply_usage_update_for_backup_changes_trigger
        AFTER UPDATE ON quick_reply_usage
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'quick_reply_usage')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'quick_reply_usage', NEW._id);
        END;
CREATE TRIGGER receipt_device_delete_for_backup_changes_trigger
        AFTER DELETE ON receipt_device
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'receipt_device')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'receipt_device', OLD._id);
        END;
CREATE TRIGGER receipt_device_insert_for_backup_changes_trigger
        AFTER INSERT ON receipt_device
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'receipt_device')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'receipt_device', NEW._id);
        END;
CREATE TRIGGER receipt_device_update_for_backup_changes_trigger
        AFTER UPDATE ON receipt_device
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'receipt_device')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'receipt_device', NEW._id);
        END;
CREATE TRIGGER receipt_orphaned_delete_for_backup_changes_trigger
        AFTER DELETE ON receipt_orphaned
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'receipt_orphaned')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'receipt_orphaned', OLD._id);
        END;
CREATE TRIGGER receipt_orphaned_insert_for_backup_changes_trigger
        AFTER INSERT ON receipt_orphaned
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'receipt_orphaned')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'receipt_orphaned', NEW._id);
        END;
CREATE TRIGGER receipt_orphaned_update_for_backup_changes_trigger
        AFTER UPDATE ON receipt_orphaned
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'receipt_orphaned')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'receipt_orphaned', NEW._id);
        END;
CREATE TRIGGER receipt_user_delete_for_backup_changes_trigger
        AFTER DELETE ON receipt_user
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'receipt_user')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'receipt_user', OLD._id);
        END;
CREATE TRIGGER receipt_user_insert_for_backup_changes_trigger
        AFTER INSERT ON receipt_user
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'receipt_user')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'receipt_user', NEW._id);
        END;
CREATE TRIGGER receipt_user_update_for_backup_changes_trigger
        AFTER UPDATE ON receipt_user
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'receipt_user')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'receipt_user', NEW._id);
        END;
CREATE TRIGGER reporting_info_bd_for_reporting_info_content_trigger BEFORE DELETE ON reporting_info BEGIN DELETE FROM reporting_info_content WHERE reporting_info_row_id=old._id; END;
CREATE TRIGGER suggest_as_you_type_delete_oldest_trigger BEFORE INSERT ON suggest_as_you_type FOR EACH ROW WHEN (SELECT COUNT(*) FROM suggest_as_you_type ) > 2000 BEGIN DELETE FROM suggest_as_you_type WHERE message_row_id = (SELECT MIN(message_row_id) FROM suggest_as_you_type); END;
CREATE TRIGGER suggested_replies_delete_oldest_trigger BEFORE INSERT ON suggested_replies FOR EACH ROW WHEN (SELECT COUNT(*) FROM suggested_replies ) > 2000 BEGIN DELETE FROM suggested_replies WHERE message_row_id = (SELECT MIN(message_row_id) FROM suggested_replies); END;
CREATE TRIGGER user_device_delete_for_backup_changes_trigger
        AFTER DELETE ON user_device
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'user_device')
  AND
  (table_row_id = OLD._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'user_device', OLD._id);
        END;
CREATE TRIGGER user_device_info_delete_for_backup_changes_trigger
        AFTER DELETE ON user_device_info
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'user_device_info')
  AND
  (table_row_id = OLD.user_jid_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('DELETE', 'user_device_info', OLD.user_jid_row_id);
        END;
CREATE TRIGGER user_device_info_insert_for_backup_changes_trigger
        AFTER INSERT ON user_device_info
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'user_device_info')
  AND
  (table_row_id = NEW.user_jid_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'user_device_info', NEW.user_jid_row_id);
        END;
CREATE TRIGGER user_device_info_update_for_backup_changes_trigger
        AFTER UPDATE ON user_device_info
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'user_device_info')
  AND
  (table_row_id = NEW.user_jid_row_id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'user_device_info', NEW.user_jid_row_id);
        END;
CREATE TRIGGER user_device_insert_for_backup_changes_trigger
        AFTER INSERT ON user_device
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'user_device')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('INSERT', 'user_device', NEW._id);
        END;
CREATE TRIGGER user_device_update_for_backup_changes_trigger
        AFTER UPDATE ON user_device
        BEGIN
          DELETE FROM backup_changes
WHERE
  (table_name = 'user_device')
  AND
  (table_row_id = NEW._id)
  AND
  (
    (operation = 'INSERT')
    OR
    (operation = 'UPDATE')
  );
          INSERT INTO backup_changes (operation, table_name, table_row_id)
VALUES('UPDATE', 'user_device', NEW._id);
        END;
CREATE INDEX message_system_chat_participant_index ON message_system_chat_participant (message_row_id);
CREATE UNIQUE INDEX message_media_interactive_annotation_vertex_index ON message_media_interactive_annotation_vertex (message_media_interactive_annotation_row_id, sort_order);
CREATE INDEX message_span_indices_message_and_span_index ON 
                 message_span_indices (message_row_id, span_type);
CREATE INDEX message_span_indices_message_and_start_index ON 
                message_span_indices (message_row_id, start_index);
CREATE INDEX message_span_indices_message_and_start_and_span_type_index ON 
                message_span_indices (message_row_id, start_index, span_type);
CREATE INDEX bot_memory_metadata_message_row_id_index ON bot_memory_metadata (message_row_id);
CREATE INDEX bot_memory_metadata_memory_annotated_user_message_key_id_index ON bot_memory_metadata (memory_annotated_user_message_key_id);
CREATE UNIQUE INDEX receipt_orphaned_index ON receipt_orphaned (chat_row_id, from_me, key_id, receipt_device_jid_row_id, receipt_recipient_jid_row_id, status);
CREATE INDEX backup_changes_operation_index 
  ON backup_changes (operation, table_name, table_row_id);
CREATE UNIQUE INDEX call_log_key_index ON call_log (jid_row_id, from_me, call_id, transaction_id);
CREATE UNIQUE INDEX message_orphaned_edit_key_index ON message_orphaned_edit (key_id, from_me, chat_row_id, sender_jid_row_id);
CREATE INDEX premium_message_info_chat_row_id_index ON premium_message_info (chat_row_id);
CREATE INDEX premium_message_info_account_jid_row_id_index ON premium_message_info (account_jid_row_id);
CREATE INDEX message_sticker_pack_name_index ON message_sticker_pack (pack_name);
CREATE INDEX message_sticker_pack_publisher_index ON message_sticker_pack (publisher);
CREATE INDEX jid_lid_map_jid_index
ON jid_map (jid_row_id);
CREATE INDEX integrator_opt_in_index ON integrator_display_name (opt_in_status);
CREATE INDEX message_poll_option_message_row_id_index ON message_poll_option (message_row_id);
CREATE INDEX message_parent_association_parent_message_row_id_and_association_type_index ON message_parent_association (parent_message_row_id, association_type);
CREATE INDEX group_past_participant_user_timestamp_index ON group_past_participant_user (timestamp);
CREATE UNIQUE INDEX group_past_participant_user_index ON group_past_participant_user (group_jid_row_id, user_jid_row_id);
CREATE UNIQUE INDEX message_orphan_key_index ON message_orphan (chat_row_id, from_me, key_id, sender_jid_row_id);
CREATE INDEX message_orphan_parent_key_index ON message_orphan (parent_chat_row_id, parent_from_me, parent_key_id, parent_sender_jid_row_id);
CREATE INDEX message_orphan_message_type_index ON message_orphan (orphan_message_type);
CREATE INDEX message_orphan_reason_index ON message_orphan (orphan_message_reason);
CREATE UNIQUE INDEX message_association_child_message_row_id_and_association_type_index ON message_association (child_message_row_id, association_type);
CREATE INDEX message_association_parent_message_row_id_and_association_type_index ON message_association (parent_message_row_id, association_type);
CREATE INDEX message_bot_feedback_index ON message_bot_feedback (bot_feedback_key_remote_jid, bot_feedback_key_from_me, bot_feedback_key_id);
CREATE INDEX status_crossposting_v3_state_idx ON status_crossposting_v3 (state);
CREATE UNIQUE INDEX message_media_vcard_count_index ON message_media_vcard_count(message_row_id);
CREATE UNIQUE INDEX message_quoted_vcard_index ON message_quoted_vcard (message_row_id, vcard);
CREATE UNIQUE INDEX message_media_interactive_annotation_index ON message_media_interactive_annotation (message_row_id, sort_order);
CREATE UNIQUE INDEX message_key_index ON message (chat_row_id, from_me, key_id, sender_jid_row_id);
CREATE INDEX message_sort_id_index ON message (sort_id);
CREATE INDEX message_starred_index ON message(starred);
CREATE INDEX message_type_chat_index ON message(chat_row_id, message_type);
CREATE INDEX message_chat_id_index ON message (chat_row_id,_id);
CREATE INDEX message_type_index ON message(message_type);
CREATE INDEX message_chat_sort_id_index ON message (chat_row_id, sort_id);
CREATE INDEX message_starred_sort_id_index ON message (starred, sort_id);
CREATE UNIQUE INDEX message_payment_transaction_id_index ON pay_transaction (id);
CREATE UNIQUE INDEX missed_call_logs_key_index ON missed_call_logs (message_row_id);
CREATE INDEX transcription_segment_message_row_id_index
          ON transcription_segment (message_row_id);
CREATE UNIQUE INDEX frequent_index ON frequent (jid_row_id, type);
CREATE INDEX bot_message_info_target_id_index 
ON bot_message_info (target_id);
CREATE UNIQUE INDEX call_log_participant_key_index ON call_log_participant_v2 (call_log_row_id, jid_row_id);
CREATE UNIQUE INDEX user_device_info_index ON user_device_info (user_jid_row_id);
CREATE INDEX user_device_info_account_type_index ON user_device_info (account_encryption_type);
CREATE UNIQUE INDEX receipt_user_index ON receipt_user(message_row_id,receipt_user_jid_row_id);
CREATE INDEX joinable_call_log_group_jid_row_id_index ON joinable_call_log (group_jid_row_id);
CREATE UNIQUE INDEX joinable_call_log_call_id_index ON joinable_call_log (call_id);
CREATE UNIQUE INDEX message_add_on_receipt_device_index ON message_add_on_receipt_device(message_add_on_row_id, receipt_device_jid_row_id);
CREATE INDEX message_add_on_receipt_device_jid_index ON message_add_on_receipt_device(receipt_device_jid_row_id);
CREATE INDEX scheduled_calls_chat_row_id_index ON scheduled_calls (key_chat_row_id, scheduled_timestamp, is_upcoming);
CREATE INDEX scheduled_calls_key_id_index ON scheduled_calls (key_chat_row_id, key_id);
CREATE INDEX scheduled_calls_timestamp_index_v2 ON scheduled_calls (is_upcoming, scheduled_timestamp);
CREATE INDEX scheduled_calls_call_log_row_id_index ON scheduled_calls (call_log_row_id);
CREATE INDEX message_details_author_device_jid_index ON message_details (author_device_jid);
CREATE INDEX receipt_device_table_device_index ON receipt_device (receipt_device_jid_row_id);
CREATE UNIQUE INDEX receipt_device_index ON receipt_device (message_row_id, receipt_device_jid_row_id);
CREATE UNIQUE INDEX user_device_index ON user_device 
                (
                    user_jid_row_id,
                    device_jid_row_id
                );
CREATE INDEX parent_group_participants_parent_jid_index ON parent_group_participants (parent_group_jid_row_id);
CREATE INDEX mms_metadata_message_and_type_index
        ON mms_metadata (message_row_id, type);
CREATE INDEX mms_metadata_insert_timestamp_index
        ON mms_metadata (insert_timestamp, type);
CREATE INDEX mms_metadata_transferred_and_message_row_id_and_type_index
        ON mms_metadata (transferred, message_row_id, type);
CREATE UNIQUE INDEX message_link_index ON message_link (message_row_id, link_index);
CREATE UNIQUE INDEX quoted_mentions_index ON message_quoted_mentions (message_row_id, jid_row_id);
CREATE INDEX composition_chat_row_id_message_type_composition_type_index ON composition 
        (chat_row_id, message_type, composition_type);
CREATE INDEX composition_timestamp_composition_type_index ON composition 
        (composition_type, timestamp);
CREATE UNIQUE INDEX message_edit_info_index ON message_edit_info (original_key_id);
CREATE INDEX message_template_button_index ON message_template_button (message_row_id);
CREATE UNIQUE INDEX message_comment_parent_message_row_id_unique_index ON message_comment (parent_message_row_id, message_row_id);
CREATE INDEX message_comment_message_row_id_index ON message_comment (message_row_id);
CREATE INDEX message_view_once_media_state_index ON message_view_once_media (state);
CREATE INDEX message_add_on_event_response_index ON message_add_on_event_response (response);
CREATE INDEX message_add_on_pin_in_chat_state_index ON message_add_on_pin_in_chat (pin_in_chat_state);
CREATE INDEX message_ephemeral_expire_timestamp_index ON message_ephemeral(expire_timestamp);
CREATE INDEX scheduled_reminder_message_chat_row_id_index ON scheduled_reminder_message (chat_row_id);
CREATE INDEX scheduled_reminder_message_timestamp_index ON scheduled_reminder_message (scheduled_reminder_timestamp_ms);
CREATE INDEX sort_order_index ON favorite (sort_order);
CREATE INDEX mms_thumbnail_metadata_transferred_index ON mms_thumbnail_metadata(transferred);
CREATE UNIQUE INDEX message_vcard_index ON message_vcard (message_row_id, vcard);
CREATE INDEX chat_group_type_index ON chat (group_type);
CREATE INDEX chat_hidden_index ON chat (hidden);
CREATE INDEX media_processed_video_message_id_index ON media_processed_video (message_row_id);
CREATE UNIQUE INDEX message_add_on_key_index ON message_add_on (chat_row_id, from_me, key_id, sender_jid_row_id);
CREATE INDEX message_add_on_status_index ON message_add_on(status);
CREATE INDEX message_add_on_chat_status_index ON message_add_on(chat_row_id, status);
CREATE INDEX message_add_on_parent_message_row_id_index ON message_add_on (parent_message_row_id);
CREATE INDEX message_add_on_expiry_timestamp_index ON message_add_on(expiry_timestamp);
CREATE UNIQUE INDEX mentions_index ON message_mentions (message_row_id, jid_row_id);
CREATE INDEX sticker_pack_stickers_message_row_id_index ON message_sticker_pack_stickers (message_row_id);
CREATE INDEX message_media_hash_index ON message_media(file_hash);
CREATE INDEX message_media_chat_index ON message_media(chat_row_id);
CREATE INDEX message_media_original_file_hash_index ON message_media(original_file_hash);
CREATE UNIQUE INDEX missed_call_log_participants_key_index ON missed_call_log_participant (call_logs_row_id, jid);
CREATE UNIQUE INDEX group_notification_version_index ON group_notification_version (group_jid_row_id);
CREATE UNIQUE INDEX message_vcard_jid_index ON message_vcard_jid(vcard_jid_row_id, vcard_row_id, message_row_id);
CREATE UNIQUE INDEX call_link_token_index ON call_link (token);
CREATE INDEX deleted_chat_job_index ON deleted_chat_job(chat_row_id, _id);
CREATE UNIQUE INDEX group_participant_user_index ON group_participant_user (group_jid_row_id, user_jid_row_id);
CREATE INDEX addon_message_media_message_row_id_index ON addon_message_media (message_row_id );
CREATE INDEX message_add_on_poll_vote_selected_option_message_add_on_row_id_index ON message_add_on_poll_vote_selected_option (message_add_on_row_id);
CREATE INDEX message_newsletter_admin_invite_newsletter_jid_row_id_index ON message_newsletter_admin_invite (newsletter_jid_row_id);
CREATE INDEX message_event_name_index ON message_event (name);
CREATE INDEX message_event_chat_row_id_and_start_time_index ON message_event (chat_row_id, start_time);
CREATE UNIQUE INDEX group_participant_device_index ON group_participant_device (group_participant_row_id, device_jid_row_id);
CREATE UNIQUE INDEX jid_key_new_index ON jid (user, server, agent, device, type);
CREATE UNIQUE INDEX jid_raw_string_index ON jid (raw_string);
CREATE UNIQUE INDEX composition_mention_unique_composition_row_id_index on composition_mention (composition_row_id, jid_row_id);
CREATE INDEX message_parent_last_comment_index 
          ON message_comment_parent (chat_row_id, last_comment_message_row_id);
CREATE INDEX message_media_interactive_annotation_embedded_music_index ON message_media_interactive_annotation_embedded_music (message_media_interactive_annotation_row_id);
CREATE UNIQUE INDEX newsletter_message_reaction_index ON newsletter_message_reaction (message_row_id, reaction);
CREATE UNIQUE INDEX newsletter_message_index ON newsletter_message (chat_row_id, server_message_id);
CREATE INDEX is_autodelete_eligible_index ON newsletter_message (is_autodelete_eligible);
CREATE INDEX newsletter_linked_account_chat_index ON newsletter_linked_account (chat_row_id);
CREATE UNIQUE INDEX newsletter_my_reaction_orphan_message_index ON newsletter_my_reaction_orphan_message (chat_row_id, server_message_id);
CREATE INDEX newsletter_membership_index ON newsletter (membership);
CREATE INDEX newsletter_code_index ON newsletter (invite_code);
CREATE INDEX newsletter_subscribers_by_type_index ON newsletter_subscribers (chat_row_id, type_of_fetch);
CREATE INDEX reporting_info_receive_timestamp_index ON reporting_info (receive_timestamp);
CREATE INDEX reporting_info_send_timestamp_index ON reporting_info (send_timestamp);
CREATE INDEX reporting_info_message_row_id_index ON reporting_info (message_row_id);
CREATE INDEX labels_sort_id ON labels (sort_id);
CREATE UNIQUE INDEX labeled_jid_index ON labeled_jid (label_id, jid_row_id);
CREATE INDEX attachments_quick_reply_id_index ON quick_reply_attachments (quick_reply_id);
CREATE INDEX agent_device_index ON agent_devices(device);
CREATE INDEX priority_inbox_chat_row_index ON priority_inbox (chat_row_id);
CREATE INDEX priority_inbox_time_created_index ON priority_inbox (time_created);
CREATE INDEX priority_inbox_score_index ON priority_inbox (priority_score);
CREATE INDEX chat_assignee_index ON agent_chat_assignment (agent_id);
CREATE INDEX message_ui_elements_message_row_id_index ON message_ui_elements (message_row_id);
CREATE INDEX group_user_index ON group_participant_user (user_jid_row_id);
CREATE INDEX jid_map_sort_id_index
ON jid_map (jid_row_id, sort_id);
CREATE INDEX lid_display_name_upper_username_index
            ON lid_display_name (UPPER(username), lid_row_id);
CREATE INDEX message_ui_elements_element_type_index ON message_ui_elements (element_type);
CREATE INDEX message_media_interactive_annotation_type_index ON message_media_interactive_annotation (type);
CREATE INDEX call_log_ts_index ON call_log (timestamp);
CREATE INDEX mms_thumbnail_metadata_insert_timestamp_index ON mms_thumbnail_metadata(insert_timestamp);
CREATE TABLE ai_rich_response_message_additional_info(message_row_id INTEGER PRIMARY KEY,ai_rich_response_additional_blob BLOB);
CREATE TABLE url_tracking_map_element(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER NOT NULL,original_url TEXT,consented_users_url TEXT,unconsented_users_url TEXT,card_index INTEGER);
CREATE TABLE support_citation_metadata(message_row_id INTEGER PRIMARY KEY,help_article_citations TEXT);
CREATE TABLE ai_rich_response_message_core_info(message_row_id INTEGER PRIMARY KEY,ai_rich_response_message_type INTEGER NOT NULL DEFAULT 0,ai_rich_response_submessage_types TEXT NOT NULL DEFAULT '',additional_table_mask INTEGER NOT NULL DEFAULT 0,ai_rich_response_core_blob BLOB, planning_status INTEGER, foa_native_data BLOB, foa_native_mutation BLOB);
CREATE TRIGGER message_bd_for_ai_rich_response_message_additional_info_trigger BEFORE DELETE ON message BEGIN DELETE FROM ai_rich_response_message_additional_info WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_ai_rich_response_message_core_info_trigger BEFORE DELETE ON message BEGIN DELETE FROM ai_rich_response_message_core_info WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_support_citation_metadata_trigger BEFORE DELETE ON message BEGIN DELETE FROM support_citation_metadata WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_url_tracking_map_element_trigger BEFORE DELETE ON message BEGIN DELETE FROM url_tracking_map_element WHERE message_row_id=old._id; END;
CREATE INDEX url_tracking_map_element_index ON url_tracking_map_element (message_row_id);
CREATE TABLE group_participant_label_metadata(group_participant_user_row_id INTEGER PRIMARY KEY,edit_time DATETIME NOT NULL);
CREATE TABLE message_system_biz_per_customer_3pd_data_share_state(message_row_id INTEGER PRIMARY KEY,data_sharing_enabled BOOLEAN);
CREATE TRIGGER group_participant_label_metadata_delete_for_backup_changes_trigger AFTER DELETE ON group_participant_label_metadata BEGIN DELETE FROM backup_changes WHERE (table_name = 'group_participant_label_metadata') AND (table_row_id = OLD.group_participant_user_row_id) AND ( (operation = 'INSERT') OR (operation = 'UPDATE') ); INSERT INTO backup_changes (operation, table_name, table_row_id) VALUES('DELETE', 'group_participant_label_metadata', OLD.group_participant_user_row_id); END;
CREATE TRIGGER group_participant_label_metadata_insert_for_backup_changes_trigger AFTER INSERT ON group_participant_label_metadata BEGIN DELETE FROM backup_changes WHERE (table_name = 'group_participant_label_metadata') AND (table_row_id = NEW.group_participant_user_row_id) AND ( (operation = 'INSERT') OR (operation = 'UPDATE') ); INSERT INTO backup_changes (operation, table_name, table_row_id) VALUES('INSERT', 'group_participant_label_metadata', NEW.group_participant_user_row_id); END;
CREATE TRIGGER group_participant_label_metadata_update_for_backup_changes_trigger AFTER UPDATE ON group_participant_label_metadata BEGIN DELETE FROM backup_changes WHERE (table_name = 'group_participant_label_metadata') AND (table_row_id = NEW.group_participant_user_row_id) AND ( (operation = 'INSERT') OR (operation = 'UPDATE') ); INSERT INTO backup_changes (operation, table_name, table_row_id) VALUES('UPDATE', 'group_participant_label_metadata', NEW.group_participant_user_row_id); END;
CREATE TRIGGER jid_bd_for_jid_map_trigger BEFORE DELETE ON jid BEGIN DELETE FROM jid_map WHERE jid_row_id=old._id OR lid_row_id=old._id; END;
CREATE TRIGGER message_system_bd_for_message_system_biz_per_customer_3pd_data_share_state_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_biz_per_customer_3pd_data_share_state WHERE message_row_id=old.message_row_id; END;
CREATE TABLE message_system_username_change(message_row_id INTEGER PRIMARY KEY,user_jid INTEGER,old_username TEXT,new_username TEXT,display_name TEXT);
CREATE INDEX joinable_call_log_phash_identifier_index 
            ON joinable_call_log (phash_identifier);
CREATE TABLE message_system_lid_change(message_row_id INTEGER PRIMARY KEY,old_lid_row_id INTEGER,new_lid_row_id INTEGER,display_name TEXT);
CREATE UNIQUE INDEX chat_account_jid_row_id_unique_index
            ON chat (account_jid_row_id);
CREATE TABLE ai_agentic_metadata(message_row_id INTEGER PRIMARY KEY,bot_progress_indicator_metadata BLOB);
CREATE TRIGGER message_bd_for_ai_agentic_metadata_trigger BEFORE DELETE ON message BEGIN DELETE FROM ai_agentic_metadata WHERE message_row_id=old._id; END;
CREATE TABLE status_notification_info(message_row_id INTEGER PRIMARY KEY,response_status_row_id INTEGER NOT NULL,original_status_row_id INTEGER NOT NULL,type INTEGER NOT NULL);
CREATE TABLE jid_user_metadata(jid_row_id INTEGER PRIMARY KEY NOT NULL,country_code TEXT);
CREATE TRIGGER message_bd_for_status_notification_info_trigger BEFORE DELETE ON message BEGIN DELETE FROM status_notification_info WHERE message_row_id = old._id; END;
CREATE TABLE optimised_delivery_info(message_row_id INTEGER PRIMARY KEY,msg_disclosed_token TEXT,msg_undisclosed_token TEXT,msg_timestamp LONG UNIQUE,token_timestamp LONG,business_jid_row_id INTEGER NOT NULL, msg_timestamp_v2 INTEGER);
CREATE TABLE payment_link_metadata(message_row_id INTEGER PRIMARY KEY,link_header_type INTEGER,cta_button_text TEXT, params_json TEXT);
CREATE TRIGGER message_bd_for_payment_link_metadata_trigger BEFORE DELETE ON message BEGIN DELETE FROM payment_link_metadata WHERE message_row_id=old._id; END;
CREATE TABLE message_limit_sharing_setting(message_row_id INTEGER PRIMARY KEY,enabled INTEGER,trigger INTEGER);
CREATE TABLE message_system_business_broadcast(message_row_id INTEGER PRIMARY KEY,broadcast_raw_jid STRING NOT NULL);
CREATE TRIGGER message_bd_for_message_limit_sharing_setting_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_limit_sharing_setting WHERE message_row_id=old._id; END;
CREATE TRIGGER message_system_bd_for_message_system_business_broadcast_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_business_broadcast WHERE message_row_id=old.message_row_id; END;
CREATE INDEX message_system_business_broadcast_raw_jid_index ON message_system_business_broadcast (broadcast_raw_jid);
CREATE TABLE message_media_map(_id INTEGER PRIMARY KEY AUTOINCREMENT,message_row_id INTEGER NOT NULL,chat_row_id INTEGER NOT NULL,media_row_id INTEGER NOT NULL);
CREATE TABLE extended_media_data(row_id INTEGER PRIMARY KEY AUTOINCREMENT,type INTEGER NOT NULL,direct_path TEXT,file_path TEXT,file_hash TEXT,file_size INTEGER,media_key BLOB,media_key_timestamp INTEGER,enc_file_hash TEXT,width INTEGER,height INTEGER,media_caption TEXT,transferred INTEGER, preview_path TEXT, external_url TEXT, mime_type TEXT, display_type INTEGER);
CREATE TRIGGER message_bd_for_message_media_map_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_media_map WHERE message_row_id=old._id; END;
CREATE TRIGGER message_media_map_bd_for_extended_media_data_trigger BEFORE DELETE ON message_media_map BEGIN DELETE FROM extended_media_data WHERE row_id=old.media_row_id; END;
CREATE INDEX extended_media_data_file_hash_index
            ON extended_media_data (
              file_hash
            );
CREATE INDEX message_media_map_message_row_id_index ON message_media_map (message_row_id);
CREATE INDEX message_media_map_chat_row_id_index ON message_media_map (chat_row_id);
CREATE INDEX message_media_map_media_row_id_index ON message_media_map (media_row_id);
CREATE TABLE group_history_metadata(message_row_id INTEGER PRIMARY KEY NOT NULL,history_receivers TEXT NOT NULL,first_message_timestamp_seconds INTEGER NOT NULL,message_count INTEGER NOT NULL);
CREATE TABLE group_history_bundle(message_row_id INTEGER PRIMARY KEY NOT NULL,process_state INTEGER NOT NULL DEFAULT 0, send_state INTEGER NOT NULL DEFAULT 0);
CREATE TRIGGER message_bd_for_group_history_bundle_trigger BEFORE DELETE ON message BEGIN DELETE FROM group_history_bundle WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_group_history_metadata_trigger BEFORE DELETE ON message BEGIN DELETE FROM group_history_metadata WHERE message_row_id=old._id; END;
CREATE TRIGGER extended_media_data_bd_for_message_media_map_trigger BEFORE DELETE ON extended_media_data BEGIN DELETE FROM message_media_map WHERE media_row_id=old.row_id; END;
CREATE TABLE message_question(message_row_id INTEGER PRIMARY KEY,response_count INTEGER DEFAULT 0, response_read_count INTEGER DEFAULT 0, is_enabled INTEGER DEFAULT 1);
CREATE TABLE message_system_detected_outcomes_labeled_chat(message_row_id INTEGER PRIMARY KEY,predefined_id INTEGER);
CREATE TABLE gap_enforcement_business_chat_thread_info_cache(business_chat_row_id INTEGER PRIMARY KEY NOT NULL,business_chat_is_mm_thread INTEGER, business_chat_thread_type INTEGER);
CREATE TABLE thread_id(_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,chat_row_id INTEGER NOT NULL,from_me INTEGER NOT NULL,key_id TEXT NOT NULL,sender_jid_row_id INTEGER NOT NULL DEFAULT 0,thread_type INTEGER NOT NULL DEFAULT 0, pin_timestamp INTEGER, deleted INTEGER NOT NULL DEFAULT 0);
CREATE TABLE thread_messages(_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,thread_id INTEGER NOT NULL,message_row_id INTEGER NOT NULL);
CREATE TRIGGER chat_bd_for_gap_enforcement_business_chat_thread_info_cache_trigger BEFORE DELETE ON chat BEGIN DELETE FROM gap_enforcement_business_chat_thread_info_cache WHERE OLD._id = business_chat_row_id; END;
CREATE TRIGGER chat_bd_for_thread_id_trigger BEFORE DELETE ON chat BEGIN DELETE FROM thread_id WHERE chat_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_question_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_question WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_thread_messages_trigger BEFORE DELETE ON message BEGIN DELETE FROM thread_messages WHERE message_row_id=old._id; END;
CREATE TRIGGER message_system_bd_for_message_system_detected_outcomes_labeled_chat_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_detected_outcomes_labeled_chat WHERE message_row_id=old.message_row_id; END;
CREATE TRIGGER thread_messages_ad_thread_messages_delete_trigger
            AFTER DELETE ON thread_messages
            FOR EACH ROW
            WHEN (SELECT COUNT(*) FROM thread_messages WHERE thread_id = old.thread_id) = 0
            BEGIN
                DELETE FROM thread_id
                WHERE _id = old.thread_id;
            END;
CREATE INDEX thread_messages_thread_id_index
            ON thread_messages (
              thread_id
            );
CREATE UNIQUE INDEX thread_messages_thread_id_and_message_row_id_index
            ON thread_messages (
              thread_id,
              message_row_id
            );
CREATE INDEX thread_messages_message_row_id_index
            ON thread_messages (
              message_row_id
            );
CREATE UNIQUE INDEX thread_id_message_key_index
            ON thread_id (
              chat_row_id,
              from_me,
              key_id,
              sender_jid_row_id,
              thread_type           
            );
CREATE INDEX thread_id_chat_row_id_and_thread_type_index
          ON thread_id (
            chat_row_id,
            thread_type
           );
CREATE TABLE group_history_bundle_association(message_row_id INTEGER PRIMARY KEY NOT NULL,bundle_message_row_id INTEGER NOT NULL, message_sort_id INTEGER, bundle_sender_jid_row_id INTEGER, bundle_message_key_id TEXT, bundle_message_key_from_me BOOLEAN, bundle_message_key_chat_row_id INTEGER);
CREATE TABLE tee_message_info_table(message_row_id INTEGER PRIMARY KEY NOT NULL,message_interaction_type INTEGER,message_outgoing_status INTEGER,message_source INTEGER NOT NULL,message_replay_metadata BLOB);
CREATE TABLE reminder(_id INTEGER PRIMARY KEY AUTOINCREMENT,reminder_id TEXT NOT NULL,message_row_id INTEGER,call_log_row_id INTEGER,surface INTEGER NOT NULL,timestamp DATETIME NOT NULL,notified INTEGER NOT NULL DEFAULT 0);
CREATE TRIGGER message_bd_for_group_history_bundle_association_trigger BEFORE DELETE ON message BEGIN DELETE FROM group_history_bundle_association WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_tee_message_info_table_trigger BEFORE DELETE ON message BEGIN DELETE FROM tee_message_info_table WHERE message_row_id=old._id; END;
CREATE TRIGGER reminder_delete_for_backup_changes_trigger
        AFTER DELETE ON reminder
        BEGIN
          DELETE FROM backup_changes WHERE (table_name = 'reminder') AND (table_row_id = OLD._id) AND ( (operation = 'INSERT') OR (operation = 'UPDATE') );
          INSERT INTO backup_changes (operation, table_name, table_row_id) VALUES('DELETE', 'reminder', OLD._id);
        END;
CREATE TRIGGER reminder_insert_for_backup_changes_trigger
        AFTER INSERT ON reminder
        BEGIN
          DELETE FROM backup_changes WHERE (table_name = 'reminder') AND (table_row_id = NEW._id) AND ( (operation = 'INSERT') OR (operation = 'UPDATE') );
          INSERT INTO backup_changes (operation, table_name, table_row_id) VALUES('INSERT', 'reminder', NEW._id);
        END;
CREATE TRIGGER reminder_update_for_backup_changes_trigger
        AFTER UPDATE ON reminder
        BEGIN
          DELETE FROM backup_changes WHERE (table_name = 'reminder') AND (table_row_id = NEW._id) AND ( (operation = 'INSERT') OR (operation = 'UPDATE') );
          INSERT INTO backup_changes (operation, table_name, table_row_id) VALUES('UPDATE', 'reminder', NEW._id);
        END;
CREATE UNIQUE INDEX reminder_message_row_id_idx 
            ON reminder (message_row_id);
CREATE UNIQUE INDEX reminder_call_log_row_id_idx 
            ON reminder (call_log_row_id);
CREATE UNIQUE INDEX reminder_id_idx 
            ON reminder (reminder_id);
CREATE TRIGGER group_participant_user_bd_for_group_participant_label_metadata_trigger BEFORE DELETE ON group_participant_user BEGIN DELETE FROM group_participant_label_metadata WHERE group_participant_user_row_id=old._id; END;
CREATE TABLE status_attribution(_id INTEGER PRIMARY KEY AUTOINCREMENT,status_row_id INTEGER NOT NULL,type INTEGER NOT NULL,content BLOB);
CREATE TABLE message_add_on_status_question_answer(message_add_on_row_id INTEGER PRIMARY KEY,answer TEXT);
CREATE TRIGGER message_add_on_bd_for_message_add_on_status_question_answer_trigger BEFORE DELETE ON message_add_on BEGIN DELETE FROM message_add_on_status_question_answer WHERE message_add_on_row_id=old._id; END;
CREATE TRIGGER message_bd_for_status_attribution_trigger BEFORE DELETE ON message BEGIN DELETE FROM status_attribution WHERE status_row_id=old._id; END;
CREATE INDEX status_attribution_status_row_id_index
            ON status_attribution (status_row_id);
CREATE TABLE message_system_privacy(message_row_id INTEGER PRIMARY KEY,is_transition INTEGER,message_privacy_type INTEGER);
CREATE TABLE message_add_on_question_response(message_add_on_row_id INTEGER PRIMARY KEY,response TEXT);
CREATE TRIGGER message_add_on_bd_for_message_add_on_question_response_trigger BEFORE DELETE ON message_add_on BEGIN DELETE FROM message_add_on_question_response WHERE message_add_on_row_id=old._id; END;
CREATE TRIGGER message_system_bd_for_message_system_privacy_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_privacy WHERE message_row_id=old.message_row_id; END;
CREATE TABLE question_reply_quoted_message(message_row_id INTEGER PRIMARY KEY,question_text TEXT,response_text TEXT,server_question_id INTEGER, question_message_type INTEGER);
CREATE TRIGGER message_bd_for_question_reply_quoted_message_trigger BEFORE DELETE ON message BEGIN DELETE FROM question_reply_quoted_message WHERE message_row_id=old._id; END;
CREATE TABLE integrity_chat_info(chat_row_id INTEGER PRIMARY KEY,is_reach_out INTEGER, is_eligible_for_link_friction_banner INTEGER);
CREATE TRIGGER chat_bd_for_integrity_chat_info_trigger
            BEFORE DELETE ON chat
            BEGIN
              DELETE FROM
                integrity_chat_info
              WHERE
                chat_row_id=old._id;
            END;
CREATE TABLE frequent_forward_chat(chat_row_id INTEGER PRIMARY KEY,num_forward INTEGER,last_forward_timestamp INTEGER, last_scan INTEGER);
CREATE INDEX forward_frequency_index 
            ON frequent_forward_chat(num_forward);
CREATE INDEX last_timestamp_index 
            ON frequent_forward_chat(last_forward_timestamp);
CREATE TABLE status_info_ranking_signals(chat_jid TEXT PRIMARY KEY NOT NULL,first_status_timestamp INTEGER NOT NULL DEFAULT 0,last_expired_status_timestamp INTEGER NOT NULL DEFAULT 0);
CREATE TABLE status_quoted_message(message_row_id INTEGER PRIMARY KEY,description_text TEXT NOT NULL,thumbnail BLOB,type INTEGER,original_status_key_id TEXT,original_status_is_from_me INTEGER,original_status_chat_id TEXT,original_status_sender_id TEXT,add_on_key_id TEXT,add_on_is_from_me INTEGER,add_on_chat_id TEXT,add_on_sender_id TEXT);
CREATE TRIGGER jid_map_delete_for_backup_changes_trigger
        AFTER DELETE ON jid_map
        BEGIN
          
        DELETE FROM backup_changes
        WHERE
          (table_name = 'jid_map')
          AND
          (table_row_id = OLD.lid_row_id)
          AND
          (
            (operation = 'INSERT')
            OR
            (operation = 'UPDATE')
          )
      ;
          
        INSERT INTO backup_changes (operation, table_name, table_row_id)
        VALUES('DELETE', 'jid_map', OLD.lid_row_id)
      ;
        END;
CREATE TRIGGER jid_map_insert_for_backup_changes_trigger
        AFTER INSERT ON jid_map
        BEGIN
          
        DELETE FROM backup_changes
        WHERE
          (table_name = 'jid_map')
          AND
          (table_row_id = NEW.lid_row_id)
          AND
          (
            (operation = 'INSERT')
            OR
            (operation = 'UPDATE')
          )
      ;
          
        INSERT INTO backup_changes (operation, table_name, table_row_id)
        VALUES('INSERT', 'jid_map', NEW.lid_row_id)
      ;
        END;
CREATE TRIGGER jid_map_update_for_backup_changes_trigger
        AFTER UPDATE ON jid_map
        BEGIN
          
        DELETE FROM backup_changes
        WHERE
          (table_name = 'jid_map')
          AND
          (table_row_id = NEW.lid_row_id)
          AND
          (
            (operation = 'INSERT')
            OR
            (operation = 'UPDATE')
          )
      ;
          
        INSERT INTO backup_changes (operation, table_name, table_row_id)
        VALUES('UPDATE', 'jid_map', NEW.lid_row_id)
      ;
        END;
CREATE TRIGGER jid_user_metadata_delete_for_backup_changes_trigger
        AFTER DELETE ON jid_user_metadata
        BEGIN
          
        DELETE FROM backup_changes
        WHERE
          (table_name = 'jid_user_metadata')
          AND
          (table_row_id = OLD.jid_row_id)
          AND
          (
            (operation = 'INSERT')
            OR
            (operation = 'UPDATE')
          )
      ;
          
        INSERT INTO backup_changes (operation, table_name, table_row_id)
        VALUES('DELETE', 'jid_user_metadata', OLD.jid_row_id)
      ;
        END;
CREATE TRIGGER jid_user_metadata_insert_for_backup_changes_trigger
        AFTER INSERT ON jid_user_metadata
        BEGIN
          
        DELETE FROM backup_changes
        WHERE
          (table_name = 'jid_user_metadata')
          AND
          (table_row_id = NEW.jid_row_id)
          AND
          (
            (operation = 'INSERT')
            OR
            (operation = 'UPDATE')
          )
      ;
          
        INSERT INTO backup_changes (operation, table_name, table_row_id)
        VALUES('INSERT', 'jid_user_metadata', NEW.jid_row_id)
      ;
        END;
CREATE TRIGGER jid_user_metadata_update_for_backup_changes_trigger
        AFTER UPDATE ON jid_user_metadata
        BEGIN
          
        DELETE FROM backup_changes
        WHERE
          (table_name = 'jid_user_metadata')
          AND
          (table_row_id = NEW.jid_row_id)
          AND
          (
            (operation = 'INSERT')
            OR
            (operation = 'UPDATE')
          )
      ;
          
        INSERT INTO backup_changes (operation, table_name, table_row_id)
        VALUES('UPDATE', 'jid_user_metadata', NEW.jid_row_id)
      ;
        END;
CREATE INDEX last_scan_index 
          ON 
              frequent_forward_chat(last_scan);
CREATE TABLE message_add_on_status_sticker_interaction(message_add_on_row_id INTEGER PRIMARY KEY,sticker_key TEXT,type INTEGER);
CREATE TABLE ai_thread_info(thread_id_row_id INTEGER PRIMARY KEY,title TEXT,creation_ts INTEGER NOT NULL,variant INTEGER NOT NULL DEFAULT 1,last_thread_messages_row_id INTEGER,last_message_timestamp INTEGER, title_source INTEGER, unseen_message_count INTEGER, origin_chat_row_id INTEGER);
CREATE TABLE message_inline_video_metadata(message_row_id INTEGER PRIMARY KEY NOT NULL,video_content_url TEXT NOT NULL,is_muted INTEGER NOT NULL DEFAULT 0, caption TEXT);
CREATE TRIGGER message_add_on_bd_for_message_add_on_status_sticker_interaction_trigger BEFORE DELETE ON message_add_on BEGIN DELETE FROM message_add_on_status_sticker_interaction WHERE message_add_on_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_inline_video_metadata_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_inline_video_metadata WHERE message_row_id=old._id; END;
CREATE TRIGGER thread_id_bd_for_ai_thread_info_trigger BEFORE DELETE ON thread_id BEGIN DELETE FROM ai_thread_info WHERE thread_id_row_id=old._id; END;
CREATE INDEX group_history_bundle_association_bundle_message_key_index 
            ON group_history_bundle_association (bundle_message_key_id);
CREATE INDEX ai_thread_info_last_message_timestamp_index
          ON ai_thread_info(last_message_timestamp);
CREATE INDEX ai_thread_info_variant_index
          ON ai_thread_info(variant);
CREATE INDEX last_expired_status_timestamp_index
      ON status_info_ranking_signals(last_expired_status_timestamp);
CREATE INDEX message_add_on_reaction_empty_reaction_index
            ON message_add_on_reaction (reaction)
            WHERE reaction = '';
CREATE INDEX is_group_status_index 
            ON status_message_info (is_group_status);
CREATE TABLE payment_extended_metadata(message_row_id INTEGER PRIMARY KEY,platform TEXT,type INTEGER,message_params_json TEXT);
CREATE TABLE bot_message_sharing_info(message_row_id INTEGER PRIMARY KEY,message_id TEXT,bot_entry_point_origin INTEGER,forward_score INTEGER NOT NULL DEFAULT 0);
CREATE TRIGGER message_bd_for_bot_message_sharing_info_trigger BEFORE DELETE ON message BEGIN DELETE FROM bot_message_sharing_info WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_payment_extended_metadata_trigger BEFORE DELETE ON message BEGIN DELETE FROM payment_extended_metadata WHERE message_row_id=old._id; END;
CREATE INDEX bot_message_sharing_info_message_id_index 
        ON bot_message_sharing_info (message_id);
CREATE TABLE integrity_deleted_chat_message_count(id INTEGER PRIMARY KEY AUTOINCREMENT,lid TEXT NOT NULL DEFAULT '',messages_receive_date TEXT NOT NULL DEFAULT '',messages_count INTEGER NOT NULL DEFAULT 0);
CREATE TABLE integrity_deleted_chat_metadata(id INTEGER PRIMARY KEY AUTOINCREMENT,lid TEXT NOT NULL DEFAULT '',chat_type INTEGER NOT NULL DEFAULT 1,is_first_reach_out INTEGER NOT NULL DEFAULT 0,chat_creation_timestamp INTEGER NOT NULL DEFAULT 0,last_incoming_message_timestamp INTEGER NOT NULL DEFAULT 0,lidHash TEXT NOT NULL DEFAULT '');
CREATE TABLE message_newsletter_follower_invite(message_row_id INTEGER PRIMARY KEY,newsletter_jid_row_id INTEGER NOT NULL,newsletter_name TEXT NOT NULL);
CREATE TRIGGER message_bd_for_message_newsletter_follower_invite_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_newsletter_follower_invite WHERE message_row_id=old._id; END;
CREATE INDEX message_newsletter_follower_invite_newsletter_jid_row_id_index 
            ON message_newsletter_follower_invite (newsletter_jid_row_id);
CREATE INDEX integrity_deleted_chat_message_count_lid_message_receive_date_index
            ON integrity_deleted_chat_message_count (lid, messages_receive_date);
CREATE TABLE dynamic_audience_sources(_id INTEGER PRIMARY KEY AUTOINCREMENT,chat_row_id INTEGER NOT NULL,dynamic_audience_type INTEGER NOT NULL,dynamic_audience_id INTEGER NOT NULL);
CREATE TABLE broadcast_chat_details(chat_row_id INTEGER PRIMARY KEY NOT NULL,use_case INTEGER NOT NULL);
CREATE TRIGGER chat_bd_for_broadcast_chat_details_trigger
            BEFORE DELETE ON chat
            BEGIN
              DELETE FROM
                broadcast_chat_details
              WHERE
                chat_row_id=old._id;
            END;
CREATE TRIGGER chat_bd_for_dynamic_audience_sources_trigger BEFORE DELETE ON chat BEGIN DELETE FROM dynamic_audience_sources WHERE chat_row_id=old._id; END;
CREATE INDEX broadcast_chat_details_use_case_index ON broadcast_chat_details (use_case);
CREATE INDEX idx_dynamic_audience_sources_dynamic_audience_type_and_id ON dynamic_audience_sources (dynamic_audience_type, dynamic_audience_id);
CREATE UNIQUE INDEX idx_dynamic_audience_sources_unique_index ON dynamic_audience_sources (chat_row_id, dynamic_audience_type, dynamic_audience_id);
CREATE TABLE message_system_update_audience_linking(message_row_id INTEGER PRIMARY KEY,lists_to_remove_count INTEGER,lists_to_sync_count INTEGER);
CREATE TRIGGER message_system_bd_for_message_system_update_audience_linking_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_update_audience_linking WHERE message_row_id=old.message_row_id; END;
CREATE INDEX integrity_chat_info_chat_row_id_index
            ON integrity_chat_info (chat_row_id);
CREATE INDEX thread_id_active_pin_timestamp_index
          ON thread_id (
            pin_timestamp
           ) WHERE deleted = 0;
CREATE TABLE message_quarantine(message_row_id INTEGER PRIMARY KEY,chat_row_id INTEGER,timestamp INTEGER NOT NULL,original_protobuf BLOB NOT NULL,serialized_stanza BLOB, protobuf_type INTEGER);
CREATE TABLE message_structure_analysis_result(message_row_id INTEGER PRIMARY KEY NOT NULL,message_field_json_array TEXT,submessage_field_json_array TEXT,button_value_json_array TEXT, cta_url_unique_count INTEGER, body_url_count INTEGER, body_url_unique_count INTEGER, url_unique_count INTEGER);
CREATE TABLE recently_selected_search_table(recent_chat_row_id INTEGER PRIMARY KEY,search_timestamp INTEGER);
CREATE TRIGGER chat_bd_for_message_quarantine_trigger BEFORE DELETE ON chat BEGIN DELETE FROM message_quarantine WHERE chat_row_id=old._id; END;
CREATE TRIGGER chat_bd_for_recently_selected_search_table_trigger BEFORE DELETE ON chat BEGIN DELETE FROM recently_selected_search_table WHERE recent_chat_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_quarantine_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_quarantine WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_message_structure_analysis_result_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_structure_analysis_result WHERE OLD._id = message_row_id; END;
CREATE INDEX message_quarantine_by_chat
            ON message_quarantine (
              chat_row_id
            );
CREATE INDEX message_quarantine_by_timestamp
            ON message_quarantine (
              timestamp
            );
CREATE INDEX recent_selected_search_timestamp_index
            ON
                recently_selected_search_table (search_timestamp);
CREATE INDEX ai_thread_info_origin_chat_row_id_index
          ON ai_thread_info(origin_chat_row_id);
CREATE TABLE message_biz_context_info(message_row_id INTEGER PRIMARY KEY,weblink_render_config INTEGER);
CREATE TABLE tee_chat_request_table(message_row_id INTEGER PRIMARY KEY NOT NULL,chat_request_type TEXT NOT NULL);
CREATE TRIGGER message_bd_for_message_biz_context_info_trigger BEFORE DELETE ON message BEGIN DELETE FROM message_biz_context_info WHERE message_row_id=old._id; END;
CREATE TRIGGER message_bd_for_tee_chat_request_table_trigger BEFORE DELETE ON message BEGIN DELETE FROM tee_chat_request_table WHERE message_row_id=old._id; END;
CREATE TABLE message_system_side_chat_privacy(message_row_id INTEGER PRIMARY KEY,origin_chat_row_id INTEGER NOT NULL);
CREATE TRIGGER message_system_bd_for_message_system_side_chat_privacy_trigger BEFORE DELETE ON message_system BEGIN DELETE FROM message_system_side_chat_privacy WHERE message_row_id=old.message_row_id; END;
CREATE INDEX call_log_telecom_uuid_index 
            ON call_log (telecom_uuid) WHERE telecom_uuid IS NOT NULL;
CREATE INDEX message_event_join_link_index
            ON message_event (join_link);
CREATE VIEW available_message_view AS
            SELECT
              
            message._id AS _id,
            message.sort_id AS sort_id,
            message.chat_row_id AS chat_row_id,
            from_me,
            key_id,
            sender_jid_row_id,
            status,
            broadcast,
            recipient_count,
            participant_hash,
            origination_flags,
            origin,
            timestamp,
            received_timestamp,
            receipt_server_timestamp,
            message_type,
            text_data,
            translated_text,
            starred,
            lookup_tables,
            message_add_on_flags,
            view_mode
        ,
              expire_timestamp,
              keep_in_chat,
              view_replies_thread_id
            FROM
              message
              LEFT JOIN deleted_chat_job AS job
              ON job.chat_row_id = message.chat_row_id
              LEFT JOIN message_ephemeral AS message_ephemeral
              ON message._id = message_ephemeral.message_row_id
            WHERE
              IFNULL(NOT(
            
            (
                IFNULL(message.starred, 0) = 0
                AND
                message.sort_id <=
                    IFNULL(job.deleted_message_row_id, -9223372036854775808)
            )
        
            OR
            
            (
                IFNULL(message.starred, 0) = 1
                AND
                message.sort_id <=
                    IFNULL(job.deleted_starred_message_row_id, -9223372036854775808)
            )
        
            OR
            
            (
                (job.deleted_message_categories IS NOT NULL)
                AND
                (job.deleted_message_categories 
                    LIKE '%"' || message.message_type || '"%')
                AND
                (   
                    
            (
                IFNULL(message.starred, 0) = 0
                AND
                message.sort_id <= 
                    IFNULL(job.deleted_categories_message_row_id, -9223372036854775808)
            )
        
                    OR
                    
            (
                IFNULL(message.starred, 0) = 1
                AND
                message.sort_id <=
                    IFNULL(job.deleted_categories_starred_message_row_id, -9223372036854775808)
            )
        
                )
            )                    
        
            OR
            
            (
                (job.singular_message_delete_rows_id IS NOT NULL)
                AND
                (job.singular_message_delete_rows_id 
                    LIKE '%"' || message._id || '"%')
            )
        
        ), 0)
/* available_message_view(_id,sort_id,chat_row_id,from_me,key_id,sender_jid_row_id,status,broadcast,recipient_count,participant_hash,origination_flags,origin,timestamp,received_timestamp,receipt_server_timestamp,message_type,text_data,translated_text,starred,lookup_tables,message_add_on_flags,view_mode,expire_timestamp,keep_in_chat,view_replies_thread_id) */;
CREATE VIEW deleted_messages_view AS
          SELECT
            
            message._id AS _id,
            message.sort_id AS sort_id,
            message.chat_row_id AS chat_row_id,
            from_me,
            key_id,
            sender_jid_row_id,
            status,
            broadcast,
            recipient_count,
            participant_hash,
            origination_flags,
            origin,
            timestamp,
            received_timestamp,
            receipt_server_timestamp,
            message_type,
            text_data,
            translated_text,
            starred,
            lookup_tables,
            message_add_on_flags,
            view_mode
        ,
            (
            (
                
            (
                (job.singular_message_delete_rows_id 
                    LIKE '%"' || message._id || '"%')
                AND
                (job.delete_files_singular_delete == 1)
            )
        
                OR
                (
                    (job.deleted_messages_remove_files == 1)
                    AND
                    (
                        
            (
                IFNULL(message.starred, 0) = 0
                AND
                message.sort_id <=
                    IFNULL(job.deleted_message_row_id, -9223372036854775808)
            )
        
                        OR
                        
            (
                IFNULL(message.starred, 0) = 1
                AND
                message.sort_id <=
                    IFNULL(job.deleted_starred_message_row_id, -9223372036854775808)
            )
        
                    )
                )
                OR
                (
                    (job.deleted_categories_remove_files == 1)
                    AND
                    
            (
                (job.deleted_message_categories IS NOT NULL)
                AND
                (job.deleted_message_categories 
                    LIKE '%"' || message.message_type || '"%')
                AND
                (   
                    
            (
                IFNULL(message.starred, 0) = 0
                AND
                message.sort_id <= 
                    IFNULL(job.deleted_categories_message_row_id, -9223372036854775808)
            )
        
                    OR
                    
            (
                IFNULL(message.starred, 0) = 1
                AND
                message.sort_id <=
                    IFNULL(job.deleted_categories_starred_message_row_id, -9223372036854775808)
            )
        
                )
            )                    
        
                )
          )
        ) AS remove_files,
            view_replies_thread_id
          FROM 
            deleted_chat_job AS job
            JOIN message AS message
              ON job.chat_row_id = message.chat_row_id
          WHERE
            IFNULL(
            
            (
                IFNULL(message.starred, 0) = 0
                AND
                message.sort_id <=
                    IFNULL(job.deleted_message_row_id, -9223372036854775808)
            )
        
            OR
            
            (
                IFNULL(message.starred, 0) = 1
                AND
                message.sort_id <=
                    IFNULL(job.deleted_starred_message_row_id, -9223372036854775808)
            )
        
            OR
            
            (
                (job.deleted_message_categories IS NOT NULL)
                AND
                (job.deleted_message_categories 
                    LIKE '%"' || message.message_type || '"%')
                AND
                (   
                    
            (
                IFNULL(message.starred, 0) = 0
                AND
                message.sort_id <= 
                    IFNULL(job.deleted_categories_message_row_id, -9223372036854775808)
            )
        
                    OR
                    
            (
                IFNULL(message.starred, 0) = 1
                AND
                message.sort_id <=
                    IFNULL(job.deleted_categories_starred_message_row_id, -9223372036854775808)
            )
        
                )
            )                    
        
            OR
            
            (
                (job.singular_message_delete_rows_id IS NOT NULL)
                AND
                (job.singular_message_delete_rows_id 
                    LIKE '%"' || message._id || '"%')
            )
        
        , 0)
          ORDER BY message._id
/* deleted_messages_view(_id,sort_id,chat_row_id,from_me,key_id,sender_jid_row_id,status,broadcast,recipient_count,participant_hash,origination_flags,origin,timestamp,received_timestamp,receipt_server_timestamp,message_type,text_data,translated_text,starred,lookup_tables,message_add_on_flags,view_mode,remove_files,view_replies_thread_id) */;
CREATE VIEW deleted_messages_ids_view AS
          SELECT
            message._id,
            message.sort_id,
            message.chat_row_id,
            message.message_type
          FROM 
            deleted_chat_job AS job
            JOIN message AS message
              ON job.chat_row_id = message.chat_row_id
          WHERE
            IFNULL(
            
            (
                IFNULL(message.starred, 0) = 0
                AND
                message.sort_id <=
                    IFNULL(job.deleted_message_row_id, -9223372036854775808)
            )
        
            OR
            
            (
                IFNULL(message.starred, 0) = 1
                AND
                message.sort_id <=
                    IFNULL(job.deleted_starred_message_row_id, -9223372036854775808)
            )
        
            OR
            
            (
                (job.deleted_message_categories IS NOT NULL)
                AND
                (job.deleted_message_categories 
                    LIKE '%"' || message.message_type || '"%')
                AND
                (   
                    
            (
                IFNULL(message.starred, 0) = 0
                AND
                message.sort_id <= 
                    IFNULL(job.deleted_categories_message_row_id, -9223372036854775808)
            )
        
                    OR
                    
            (
                IFNULL(message.starred, 0) = 1
                AND
                message.sort_id <=
                    IFNULL(job.deleted_categories_starred_message_row_id, -9223372036854775808)
            )
        
                )
            )                    
        
            OR
            
            (
                (job.singular_message_delete_rows_id IS NOT NULL)
                AND
                (job.singular_message_delete_rows_id 
                    LIKE '%"' || message._id || '"%')
            )
        
        , 0)
/* deleted_messages_ids_view(_id,sort_id,chat_row_id,message_type) */;
CREATE VIEW chat_view AS 
            SELECT
                
                chat._id AS _id,                
                chat.hidden AS hidden,
                chat.subject AS subject,
                chat.created_timestamp AS created_timestamp,
                chat.last_message_row_id AS last_message_row_id,
                chat.display_message_row_id AS display_message_row_id,
                chat.last_read_message_row_id AS last_read_message_row_id,
                chat.last_read_receipt_sent_message_row_id AS last_read_receipt_sent_message_row_id,
                chat.last_important_message_row_id AS last_important_message_row_id,
                chat.archived AS archived,
                chat.sort_timestamp AS sort_timestamp,
                chat.mod_tag AS mod_tag,
                chat.gen AS gen,
                chat.spam_detection AS spam_detection,
                chat.unseen_earliest_message_received_time AS unseen_earliest_message_received_time,
                chat.unseen_message_count AS unseen_message_count,
                chat.unseen_missed_calls_count AS unseen_missed_calls_count,
                chat.unseen_row_count AS unseen_row_count,
                chat.unseen_message_reaction_count AS unseen_message_reaction_count,
                chat.unseen_comment_message_count AS unseen_comment_message_count,
                chat.last_message_reaction_row_id AS last_message_reaction_row_id,
                chat.last_seen_message_reaction_row_id AS last_seen_message_reaction_row_id,
                chat.plaintext_disabled AS plaintext_disabled,
                chat.vcard_ui_dismissed AS vcard_ui_dismissed,
                chat.change_number_notified_message_row_id AS change_number_notified_message_row_id,
                chat.show_group_description AS show_group_description,
                chat.ephemeral_expiration AS ephemeral_expiration,
                chat.ephemeral_setting_timestamp AS ephemeral_setting_timestamp,
                chat.ephemeral_displayed_exemptions AS ephemeral_displayed_exemptions,
                chat.ephemeral_disappearing_messages_initiator AS ephemeral_disappearing_messages_initiator,
                chat.unseen_important_message_count AS unseen_important_message_count,
                chat.group_type AS group_type,
                chat.growth_lock_level AS growth_lock_level,
                chat.growth_lock_expiration_ts AS growth_lock_expiration_ts,
                chat.last_read_message_sort_id AS last_read_message_sort_id,
                chat.display_message_sort_id AS display_message_sort_id,
                chat.last_message_sort_id AS last_message_sort_id,
                chat.last_read_receipt_sent_message_sort_id AS last_read_receipt_sent_message_sort_id,
                chat.has_new_community_admin_dialog_been_acknowledged AS has_new_community_admin_dialog_been_acknowledged,
                chat.history_sync_progress AS history_sync_progress,
                chat.chat_lock AS chat_lock,
                chat.chat_origin AS chat_origin,
                chat.participation_status AS participation_status,
                chat.chat_encryption_state AS chat_encryption_state,
                chat.group_member_count AS group_member_count,
                chat.limited_sharing AS limited_sharing,
                chat.limited_sharing_setting_timestamp AS limited_sharing_setting_timestamp,
                chat.is_contact AS is_contact
        ,
                CAST(
                  COALESCE(
                    chat.account_jid_row_id, 
                    chat.jid_row_id
                  ) AS INTEGER) AS jid_row_id,
                chat.jid_row_id AS original_jid_row_id
            FROM chat AS chat
/* chat_view(_id,hidden,subject,created_timestamp,last_message_row_id,display_message_row_id,last_read_message_row_id,last_read_receipt_sent_message_row_id,last_important_message_row_id,archived,sort_timestamp,mod_tag,gen,spam_detection,unseen_earliest_message_received_time,unseen_message_count,unseen_missed_calls_count,unseen_row_count,unseen_message_reaction_count,unseen_comment_message_count,last_message_reaction_row_id,last_seen_message_reaction_row_id,plaintext_disabled,vcard_ui_dismissed,change_number_notified_message_row_id,show_group_description,ephemeral_expiration,ephemeral_setting_timestamp,ephemeral_displayed_exemptions,ephemeral_disappearing_messages_initiator,unseen_important_message_count,group_type,growth_lock_level,growth_lock_expiration_ts,last_read_message_sort_id,display_message_sort_id,last_message_sort_id,last_read_receipt_sent_message_sort_id,has_new_community_admin_dialog_been_acknowledged,history_sync_progress,chat_lock,chat_origin,participation_status,chat_encryption_state,group_member_count,limited_sharing,limited_sharing_setting_timestamp,is_contact,jid_row_id,original_jid_row_id) */;
