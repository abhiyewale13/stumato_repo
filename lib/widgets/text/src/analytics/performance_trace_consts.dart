/// todo(satyam): refactor this

//* Scan and Pay
const traceSapRiveLoad = 'sap_rive_load';
const traceSapScreenLoad = 'sap_screen_load';
const traceSapScannerDpLoad = 'sap_scanner_dp_load';
const traceSapCameraLoad = 'sap_camera_load';
const traceSapFlutterEntryToCamScrInitDelay = 'sap_flutter_entry_to_cam_scr_init_delay';
const traceSapEngineInitToFlutterEntry = 'snp_engine_init_to_flutter_entry';
const traceSnpLoaded = 'snp_loaded';
const traceSnpSkinLoad = 'snp_skin_load';
const traceSnpPermissionLoad = 'snp_first_permission_status_load';
const traceSnpPageLoad = 'snp_home_load';
const traceSnpDpLoad = 'snp_dp_load';
const traceSnpStreaksLoad = 'snp_streaks_load';
const traceSnpOnboarding = 'snp_onboarding';

//* P2P
const traceP2PRiveLoad = 'p2p_rive_load';
const traceEventP2pContactSync = 'p2p_contact_sync';
const traceEventP2pSearchSelection = 'p2p_search_selection';
const traceEventP2PScreenLoadNtu = "p2p_screen_load_ntu";
const traceEventP2PScreenLoadEtu = "p2p_screen_load_etu";
const traceEventP2pAmountEntryLoadVpaResolved = 'p2p_amount_entry_load_vpa_resolved';
const traceProtoSNPInstrumentLoad = 'proto_snp_instrument_load';

//* P2P SNP Common
const traceSapAmountScreenLoad = 'sap_amount_screen_load';
const traceUpiPayInstrumentSelectionActive = 'upipay_instrument_selection_active';
const traceEventUpiPayOnboarding = 'upipay_onboarding';
const traceEventUpiPayOnboardingStep = 'upipay_onboarding_step';
const traceSnpAmountScreenLoaded = 'snp_amount_screen_loaded';
const traceSnpPaymentSuccessEvent = 'snp_payment_success';
const traceP2pAmountScreenLoaded = 'p2p_amount_screen_loaded';
const traceSnpPayNowEnabled = 'snp_amount_screen_pay_now_enabled';
const traceP2pPayNowEnabled = 'p2p_amount_screen_pay_now_enabled';
const traceAmountScreenLoadTrace = 'amount_screen_load_trace';

//* PPS (old + new)
const traceEventUpiPayPayment = 'upipay_payment';
const traceUpiRewardPolling = 'upipay_reward_polling';
const traceUpiPostPaymentLoad = 'upipay_post_payment_load';
const traceUpiProcessingPolling = 'upipay_processing_polling';
const traceSnpTerminalState = 'snp_terminal_state';

//* PPS (new)
const traceUpiPpsRewardLoad = "upi_pay_pps_reward_load";
const traceUpiPpsSuccessHeimdallDataLoad = "upi_pay_pps_success_heimdall_data_load";

//* Mint
const traceMintContactsLoad = 'mint_contacts_load';
const traceMintHomePageLoad = 'mint_home_page_load';
const traceMintSliderPageLoad = 'mint_slider_page_load';

//* Max
const traceMaxHomePageLoad = 'max_home_page_load';
const traceMaxContactsPageLoad = 'max_contacts_page_load';
const traceMaxBankPageLoad = 'max_bank_page_load';
const traceMaxAmountPageLoad = 'max_amount_page_load';

//* Pay Farm
const tracePayFarmLoad = 'pay_farm_load';
const tracePayAllBillsLoad = 'pay_all_bills_load';
const tracePayAllCategoriesLoad = 'pay_all_categories_load';
const tracePayAllOffersLoad = 'pay_all_offers_load';
const tracePayManageLoad = 'pay_farm_manage_load';
const tracePayManageBillRefreshLoad = 'pay_manage_bill_refresh_load';
const traceSnpShortcutTapToScanAvailable = 'snp_shortcut_tap_to_scan_available';

//* gift-vouchers
const traceVoucherDetailsPageLoad = 'voucher_details_page_load';
const traceMyVoucherPageLoad = 'my_voucher_page_load';
const tracePpsVoucherDetailsPageLoad = 'pps_voucher_details_page_load';
const tracePpsPageLoad = 'pps_page_load';

//* RFW
const traceRfwWidgetLoad = 'rfw_widget_load';

//! NOT USED ANYWHERE
// const traceSapHandshakeDelay = 'snp_handshake';
// const traceSapInstrumentSelectionActive = 'sap_instrument_selection_active';
// const traceSapRewardPolling = 'sap_reward_polling';
// const traceSapPostPaymentLoad = 'sap_post_payment_load';
// const traceSapProcessingPolling = 'sap_processing_polling';

const metricCount = 'count';

const attrPollingInterval = 'polling_interval';
const attrStatus = 'status';
const attrPostPaymentScreenType = 'post_payment_screen_type';
const attrIsQrIdentifiedLocally = 'is_qr_identified_locally';
const attrPaymentLob = 'payment_lob';
const attrCheckoutType = 'checkout_type';
const attrFlow = 'flow';
const traceAttrNullOrEmpty = 'null_or_empty';
const traceAttrLob = 'lob';
const traceAttrStatus = 'status';
const traceAttrPaymentSdk = 'payment_sdk';
const traceAttrStep = 'step';
const traceAttrVpaSource = 'vpa_source';
const traceAttrType = 'type';
const traceAttrResolutionSource = 'resolution_source';
const traceAttrEndPoint = 'end_point';
const traceAttrServiceFlow = 'service_flow'; // for upi service flows - zap or non zap
const traceAttrValSuccess = 'success';
const traceAttrValFailure = 'failure';
const traceAttrValProcessing = 'processing';
const traceAttrValP2p = 'p2p';
const traceAttrValSnp = 'snp';
const traceAttrValIntent = 'intent';
const traceAttrValCheckout = 'checkout';
const traceAttrValCheckoutLite = 'checkout_lite';
const traceAttrValLottie = 'lottie';
const traceAttrValImageUpload = 'image_upload';
const traceAttrValPermission = 'permission';
const traceAttrValSetPrimary = 'set_primary';
const traceAttrValScrapper = 'scrapper';
const traceAttrValMapper = 'mapper';
const traceAttrValVpa = 'vpa';
const traceAttrValPhoneNumber = 'phone_number';
const traceAttrValUpiNumber = 'upi_number';
const traceCardsFlowOnboarding = "flutter_onboarding_cards_preview_animation";
const traceBillsFlowOnboarding = "flutter_onboarding_bills_preview_animation";
const traceReferralSplash = "flutter_referral_splash";
const traceReferralLoadingTime = "referral_v5_loading_time";
const traceCBFlutterFlowLoad = "flutter_onboarding_cb_fragment_to_carousel_load";
const traceCBFlutterFlowStart = "flutter_onboarding_cb_fragment_to_cards_and_bills_screen_load";
const traceCBFlutterCardsEndBillsStart = "flutter_onboarding_cards_end_bills_start";
const traceCBCardsState = "flutter_onboarding_cb_cards_state";
const traceCBBillsState = "flutter_onboarding_cb_bills_state";

//Proto Attributes
const traceAttrProtoApiUsage = "is_proto_api_used";

class PerformanceTraceConsts {
  static const flutterHandhshake = 'flutter_handshake';

  // UPI INTENT
  static const upiIntentHandshake = 'upi_intent_handshake';
  static const upiIntentTriggerRecieved = 'upi_intent_trigger_recieved';
  static const upiIntentCheckoutFlowTriggered = 'upi_intent_checkout_flow_triggered';
  static const upiIntentContainerFlowTriggered = 'upi_intent_container_flow_triggered';
  static const attrUpiIntentFirebaseConfig = 'upi_intent_firebase_cohort';
  static const attrUpiIntentAmountEmpty = 'upi_intent_amount_empty';
  static const attrUpiIntentMamPresent = 'upi_intent_mam_present';
  static const attrUpiIntentAmMamSame = 'upi_intent_am_mam_same';
  static const attrUpiIntentIsMandate = 'upi_intent_is_mandate';

  static const pigeonBindings = 'pigeon_bindings';

  static const skinLoad = "skin_load";

  static const attrEntryPoint = 'entry_point';
}
