import {LightningElement, track} from "lwc";
import {NavigationMixin} from "lightning/navigation";
import aura_show_accounts from "@salesforce/apex/CustomerTagsController.aura_show_accounts";
import aura_show_available_tags from "@salesforce/apex/CustomerTagsController.aura_show_available_tags";
import aura_assign_tag from "@salesforce/apex/CustomerTagsController.aura_assign_tag";
import aura_show_tag_to_be_unassign from "@salesforce/apex/CustomerTagsController.aura_show_tag_to_be_unassign";
import aura_unassign_tag from "@salesforce/apex/CustomerTagsController.aura_unassign_tag";
import aura_show_tags from "@salesforce/apex/CustomerTagsController.aura_show_tags";
import aura_add_new_tag from "@salesforce/apex/CustomerTagsController.aura_add_new_tag";
import aura_show_tag_to_be_deleted from "@salesforce/apex/CustomerTagsController.aura_show_tag_to_be_deleted";
import aura_delete_tag from "@salesforce/apex/CustomerTagsController.aura_delete_tag";
import NUMERIC_FIELD_BACKGROUND from "@salesforce/resourceUrl/numeric_field_background";

export default class AccountsList extends NavigationMixin(LightningElement){
  @track filter_counter = 0;
  @track types = [];
  @track ratings = [];
  @track tag_filter = "";
  @track owner_name_filter = "";
  @track name_filter = "";
  @track type_filter = "";
  @track annual_revenue_greater_than_filter = "";
  @track annual_revenue_less_than_filter = "";
  @track rating_filter = "";
  @track city_filter = "";
  @track state_filter = "";
  @track industry_filter = "";
  @track selected_sorting_order = "";
  
  @track show_list = true;
  @track accounts = [];
  @track pages = [];
  @track records_per_page = 10;
  @track show_first_page_button = true;
  @track first_page = 0;
  @track show_first_ellipsis = true;
  @track first_on_the_list_of_pages = 0;
  @track current_page = 1;
  @track last_on_the_list_of_pages = 0;
  @track show_last_ellipsis = true;
  @track last_page = 0;
  @track show_last_page_button = true;
  
  @track selected_account_id = "";
  @track selected_account_name = "";
  @track selected_tag_id = "";
  @track selected_tag_name = "";
  @track selected_tag_color = "";
  
  @track show_available_tags_popup = false;
  @track keep_available_tags_popup = false;
  @track tags_in_popup = [];
  @track show_assign_tag_message = false;
  @track assign_tag_message = "";
  
  @track show_unassign_tag_popup = false;
  @track keep_unassign_tag_popup = false;
  @track show_unassign_tag_message = false;
  @track unassign_tag_message = "";
  
  @track tags = [];
  @track show_new_tag_popup = false;
  @track keep_new_tag_popup = false;
  @track colors = [];
  @track tag_name = "";
  @track tag_color = "";
  @track show_preview_tag = false;
  @track show_new_tag_message = false;
  @track new_tag_message = "";
  
  @track show_delete_tag_popup = false;
  @track keep_delete_tag_popup = false;
  @track show_delete_tag_message = false;
  @track delete_tag_message = "";
  
  get numeric_field_background(){
    return "background-image: url(" + NUMERIC_FIELD_BACKGROUND +");";
  }
  
  connectedCallback(){
    window.addEventListener("click", this.window_event_click);
    window.addEventListener("resize", this.window_event_resize);
    window.addEventListener("scroll", this.window_event_scroll);
    this.show_accounts();
    this.show_tags();
  }
  disconnectedCallback(){
    window.removeEventListener("click", this.window_event_click);
    window.removeEventListener("resize", this.window_event_resize);
    window.removeEventListener("scroll", this.window_event_scroll);
  }
  
  window_event_click = () => {
    this.remove_popups();
  }
  window_event_resize = () => {
    const popups = this.template.querySelectorAll(".popup");
    for(let i = 0; i < popups.length; i++){
      this.position_popup(popups[i]);
    }
  }
  window_event_scroll = () => {
    const popups = this.template.querySelectorAll(".popup");
    for(let i = 0; i < popups.length; i++){
      this.position_popup(popups[i]);
    }
  }
  
  /* Show Accounts */
  show_accounts(screen_movement = false){
    this.filter_counter++;
    let filter_action_number = this.filter_counter;
    const filters = {
      tag_filter: this.tag_filter,
      owner_name_filter: this.owner_name_filter,
      name_filter: this.name_filter,
      type_filter: this.type_filter,
      annual_revenue_greater_than_filter: this.annual_revenue_greater_than_filter,
      annual_revenue_less_than_filter: this.annual_revenue_less_than_filter,
      rating_filter: this.rating_filter,
      city_filter: this.city_filter,
      state_filter: this.state_filter,
      industry_filter: this.industry_filter
    };
    aura_show_accounts({
      filters: filters,
      selected_sorting_order: this.selected_sorting_order,
      current_page: this.current_page,
      records_per_page: this.records_per_page
    }).then(async apex_result => {
      if(filter_action_number >= this.filter_counter){
        this.types = apex_result.types;
        this.ratings = apex_result.ratings;
        let accounts = apex_result.accounts;
        if(accounts.length != 0){
          if(this.current_page == 0){
            this.current_page = 1;
          }
          
          this.accounts = [];
          for(let i = 0; i < accounts.length; i++){
            let account = new Object();
            
            account.id = accounts[i].Id;
            account.url = "#";
            if(account.id){
              account.url = await this[NavigationMixin.GenerateUrl]({
                type: "standard__recordPage",
                attributes:{
                  recordId: account.id,
                  actionName: "view"
                }
              });
            }
            
            account.name = accounts[i].Name;
            
            account.has_type = false;
            account.type = accounts[i].Type;
            if(typeof account.type != "undefined"){
              if(account.type !== null && account.type !== ""){
                account.has_type = true;
              }
            }
            
            account.has_annual_revenue = false;
            account.annual_revenue = accounts[i].AnnualRevenue;
            account.currency_iso_code = accounts[i].CurrencyIsoCode ? accounts[i].CurrencyIsoCode : "USD";
            if(typeof account.annual_revenue != "undefined"){
              if(account.annual_revenue !== null && account.annual_revenue !== ""){
                account.has_annual_revenue = true;
              }
            }
            
            account.has_rating = false;
            account.rating = accounts[i].Rating;
            if(typeof account.rating != "undefined"){
              if(account.rating !== null && account.rating !== ""){
                account.has_rating = true;
              }
            }
            
            account.has_information_part_two = true;
            if(account.has_type === false
              && account.has_annual_revenue === false
              && account.has_rating === false){
              account.has_information_part_two = false;
            }
            
            account.has_website = false;
            account.website = accounts[i].Website;
            if(typeof account.website != "undefined"){
              if(account.website !== null && account.website !== ""){
                account.has_website = true;
              }
            }
            
            account.has_information_part_three = true;
            if(account.has_website === false){
              account.has_information_part_three = false;
            }
            
            account.has_city_and_state = false;
            account.billing_city = accounts[i].BillingCity;
            account.billing_state = accounts[i].BillingState;
            account.google_maps_url = "#";
            if(typeof account.billing_city != "undefined" 
              && typeof account.billing_state != "undefined"){
              if(account.billing_city !== null && account.billing_state !== null
                && account.billing_city !== "" && account.billing_state !== ""){
                account.has_city_and_state = true;
                
                account.google_maps_url = "https://google.com/maps?q=";
                account.google_maps_url += account.billing_city;
                account.google_maps_url += ", ";
                account.google_maps_url += account.billing_state;
              }
            }
            
            account.has_industry = false;
            account.industry = accounts[i].Industry;
            if(typeof account.industry != "undefined"){
              if(account.industry !== null && account.industry !== ""){
                account.has_industry = true;
              }
            }
            
            account.has_information_part_four = true;
            if(account.has_city_and_state === false
              && account.has_industry === false){
                account.has_information_part_four = false;
            }
            
            account.has_owner = false;
            account.owner_id = accounts[i].Owner.Id;
            account.owner_name = accounts[i].Owner.Name;
            account.owner_url = "#";
            if(typeof account.owner_name != "undefined"){
              if(account.owner_name !== null && account.owner_name !== ""){
                account.has_owner = true;
                
                if(account.owner_id){
                  account.owner_url = await this[NavigationMixin.GenerateUrl]({
                    type: "standard__recordPage",
                    attributes:{
                      recordId: account.owner_id,
                      actionName: "view"
                    }
                  });
                }
              }
            }
            
            account.tags = [];
            if(accounts[i].rodrigo__CustomerTagsList__r){
              const tags = accounts[i].rodrigo__CustomerTagsList__r;
              for(let j = 0; j < tags.length; j++){
                if(tags[j].rodrigo__CustomerTag__r){
                  let tag = new Object();
                  tag.id = tags[j].rodrigo__CustomerTag__r.Id;
                  tag.name = tags[j].rodrigo__CustomerTag__r.Name;
                  tag.color = tags[j].rodrigo__CustomerTag__r.rodrigo__Color__c;
                  account.tags.push(tag);
                }
              }
            }
            
            this.accounts.push(account);
          }
          
          this.last_page = apex_result.last_page;
          
          this.first_on_the_list_of_pages = this.current_page - 5;
          this.first_on_the_list_of_pages = Math.max(this.first_on_the_list_of_pages, 1);
          this.last_on_the_list_of_pages = this.current_page + 5;
          this.last_on_the_list_of_pages = Math.min(this.last_on_the_list_of_pages, this.last_page);
          
          if(1 == this.first_on_the_list_of_pages){
            this.show_first_page_button = false;
          }else{
            this.show_first_page_button = true;
          }
          if(1 >= this.first_on_the_list_of_pages - 1){
            this.show_first_ellipsis = false;
          }else{
            this.show_first_ellipsis = true;
          }
          
          if(this.last_page <= this.last_on_the_list_of_pages + 1){
            this.show_last_ellipsis = false;
          }else{
            this.show_last_ellipsis = true;
          }
          if(this.last_page == this.last_on_the_list_of_pages){
            this.show_last_page_button = false;
          }else{
            this.show_last_page_button = true;
          }
          
          let pages = [];
          for(let i = this.first_on_the_list_of_pages; i <= this.last_on_the_list_of_pages; i++){
            let page = new Object();
            
            page.id = "page_" + i.toString().padStart(3, "0");
            page.number = i;
            page.highlighted = false;
            if(i == this.current_page){
              page.highlighted = true;
            }
            pages.push(page);
          }
          this.pages = pages;
          
          this.show_list = true;
        }else{
          this.current_page = 0;
          this.show_list = false;
          this.empty_list_message = "No accounts found. Try adjusting or clearing your filters.";
          if((this.tag_filter === "" || this.tag_filter === null) 
&& (this.owner_name_filter === "" || this.owner_name_filter === null) 
&& (this.name_filter === "" || this.name_filter === null) 
&& (this.type_filter === "" || this.type_filter === null) 
&& (this.annual_revenue_greater_than_filter === "" || this.annual_revenue_greater_than_filter === null) 
&& (this.annual_revenue_less_than_filter === "" || this.annual_revenue_less_than_filter === null) 
&& (this.rating_filter === "" || this.rating_filter === null) 
&& (this.city_filter === "" || this.city_filter === null) 
&& (this.state_filter === "" || this.state_filter === null) 
&& (this.industry_filter === "" || this.industry_filter === null)){
            this.empty_list_message = "There are no accounts available to display.";
          }
        }
        
        if(screen_movement){
          window.scrollTo(0, 0);
        }
      }
    }).catch(error => {
      console.error("JS Error 001", error);
    });
  }
  
  /* Filters */
  tag_filter_oninput_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    this.tag_filter = tag_that_triggered_the_event.value;
    this.current_page = 1;
    this.show_accounts(false);
  }
  owner_name_filter_oninput_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    this.owner_name_filter = tag_that_triggered_the_event.value;
    this.current_page = 1;
    this.show_accounts(false);
  }
  name_filter_oninput_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    this.name_filter = tag_that_triggered_the_event.value;
    this.current_page = 1;
    this.show_accounts(false);
  }
  type_filter_onchange_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    this.type_filter = tag_that_triggered_the_event.value;
    this.current_page = 1;
    this.show_accounts(false);
  }
  annual_revenue_greater_than_filter_oninput_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    tag_that_triggered_the_event.value = tag_that_triggered_the_event.value.replace(/[^0-9]/g, "");
    this.annual_revenue_greater_than_filter = tag_that_triggered_the_event.value;
    this.current_page = 1;
    this.show_accounts(false);
  }
  annual_revenue_less_than_filter_oninput_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    tag_that_triggered_the_event.value = tag_that_triggered_the_event.value.replace(/[^0-9]/g, "");
    this.annual_revenue_less_than_filter = tag_that_triggered_the_event.value;
    this.current_page = 1;
    this.show_accounts(false);
  }
  rating_filter_onchange_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    this.rating_filter = tag_that_triggered_the_event.value;
    this.current_page = 1;
    this.show_accounts(false);
  }
  city_filter_oninput_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    this.city_filter = tag_that_triggered_the_event.value;
    this.current_page = 1;
    this.show_accounts(false);
  }
  state_filter_oninput_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    this.state_filter = tag_that_triggered_the_event.value;
    this.current_page = 1;
    this.show_accounts(false);
  }
  industry_filter_oninput_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    this.industry_filter = tag_that_triggered_the_event.value;
    this.current_page = 1;
    this.show_accounts(false);
  }
  sort_select_onchange_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    this.selected_sorting_order = tag_that_triggered_the_event.value;
    this.current_page = 1;
    this.show_accounts(false);
  }
  records_per_page_select_onchange_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    this.records_per_page = tag_that_triggered_the_event.value;
    this.current_page = 1;
    this.show_accounts(false);
  }
  
  /* Pagination */
  pagination_button_mousedown_event(event){
    event.preventDefault();
  }
  
  pagination_button_click_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    tag_that_triggered_the_event.blur();
    if(tag_that_triggered_the_event.classList.contains("previous_page_button")){
      this.current_page--;
      if(this.current_page < 1){
        this.current_page = 1;
      }
    }else if(tag_that_triggered_the_event.classList.contains("first_page_button")){
      this.current_page = 1;
    }else if(tag_that_triggered_the_event.classList.contains("unselected_page_button")){
      this.current_page = parseInt(tag_that_triggered_the_event.innerText, 10);
    }else if(tag_that_triggered_the_event.classList.contains("last_page_button")){
      this.current_page = this.last_page;
    }else if(tag_that_triggered_the_event.classList.contains("next_page_button")){
      this.current_page++;
      if(this.current_page > this.last_page){
        this.current_page = this.last_page;
      }
    }
    
    let screen_movement = false;
    if(tag_that_triggered_the_event.getBoundingClientRect().top > 500){
      screen_movement = true;
    }
    this.show_accounts(screen_movement);
  }
  
  /* Show Tags */
  show_tags(){
    aura_show_tags().then(async apex_result => {
      this.colors = apex_result.colors;
      let tags = apex_result.tags;
      
      this.tags = [];
      for(let i = 0; i < tags.length; i++){
        let tag = new Object();
        
        tag.id = tags[i].Id;
        tag.name = tags[i].Name;
        tag.color = tags[i].rodrigo__Color__c;
        
        this.tags.push(tag);
      }
    }).catch(error => {
      console.error("JS Error 002", error);
    });
  }
  
  /* Popups */
  position_popup(popup){
    const customer_tags_screen = this.refs.customer_tags_screen;
    const customer_tags_screen_style = window.getComputedStyle(customer_tags_screen);
    let screen_width = 0;
    screen_width += parseInt(customer_tags_screen_style.marginLeft, 10) || 0;
    screen_width += parseInt(customer_tags_screen_style.width, 10) || 0;
    screen_width += parseInt(customer_tags_screen_style.marginRight, 10) || 0;
    
    const popup_computed_style = window.getComputedStyle(popup);
    let popup_width = 0;
    popup_width += parseInt(popup_computed_style.width, 10) || 0;
    
    let x_position = window.scrollX + (screen_width / 2 - popup_width / 2);
    if(popup_width >= screen_width){
      x_position = window.scrollX;
    }
    let y_position = window.scrollY + 50;
    
    popup.style.position = "absolute";
    popup.style.top = y_position + "px";
    popup.style.left = x_position + "px";
  }
  
  remove_popups(){
    if(this.keep_available_tags_popup){
      this.keep_available_tags_popup = false;
    }else{
      this.show_available_tags_popup = false;
    }
    
    if(this.keep_unassign_tag_popup){
      this.keep_unassign_tag_popup = false;
    }else{
      this.show_unassign_tag_popup = false;
    }
    
    if(this.keep_new_tag_popup){
      this.keep_new_tag_popup = false;
    }else{
      this.show_new_tag_popup = false;
    }
    
    if(this.keep_delete_tag_popup){
      this.keep_delete_tag_popup = false;
    }else{
      this.show_delete_tag_popup = false;
    }
  }
  
  //Popup - Available Tags
  show_available_tags_onclick_event(event){
    const account_id = event.currentTarget.dataset.account_id;
    
    this.show_available_tags_popup = true;
    this.keep_available_tags_popup = true;
    this.show_assign_tag_message = false;
    
    Promise.resolve().then(() => {
      const popup = this.template.querySelector(".available_tags_popup");
      if(popup){
        this.position_popup(popup);
      }
    });
    
    this.selected_account_id = "";
    this.selected_account_name = "";
    this.tags_in_popup = [];
    aura_show_available_tags({
      account_id: account_id
    }).then(async apex_result => {
      this.selected_account_id = "";
      this.selected_account_name = "";
      if(apex_result.account_id){
        this.selected_account_id = apex_result.account_id;
      }
      if(apex_result.account_name){
        this.selected_account_name = apex_result.account_name;
      }
      
      const tags = apex_result.available_tags || [];
      this.tags_in_popup = [];
      for(let i = 0; i < tags.length; i++){
        let tag = new Object();
        
        tag.id = tags[i].Id;
        tag.name = tags[i].Name;
        tag.color = tags[i].rodrigo__Color__c;
        
        this.tags_in_popup.push(tag);
      }
    }).catch(error => {
      console.error("JS Error 003", error);
    });
  }
  available_tags_popup_onclick_event(){
    this.show_available_tags_popup = true;
    this.keep_available_tags_popup = true;
  }
  button_close_available_tags_popup_onclick_event(event){
    event.stopPropagation();
    this.show_available_tags_popup = false;
  }
  assign_tag_onclick_event(event){
    const tag_id = event.currentTarget.dataset.tag_id;
    
    aura_assign_tag({
      account_id: this.selected_account_id,
      tag_id: tag_id
    }).then(async apex_result => {
      switch(apex_result){
        case "Assign complete.":
        case "The assignment had already been made.":
          this.selected_account_id = "";
          this.selected_account_name = "";
          this.tags_in_popup = [];
          this.show_available_tags_popup = false;
          this.show_accounts(false);
        break;
        default:
          this.show_assign_tag_message = true;
          this.assign_tag_message = apex_result;
        break;
      }
    }).catch(error => {
      console.error("JS Error 004", error);
    });
  }
  cancel_assign_tag_button_onmouseleave_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    tag_that_triggered_the_event.blur();
  }
  cancel_assign_tag_button_onclick_event(event){
    event.stopPropagation();
    const tag_that_triggered_the_event = event.currentTarget;
    tag_that_triggered_the_event.blur();
    this.show_available_tags_popup = false;
  }
  
  //Popup - Unassign Tag
  show_unassign_tag_popup_onclick_event(event){
    const account_id = event.currentTarget.dataset.account_id;
    const tag_id = event.currentTarget.dataset.tag_id;
    
    this.show_unassign_tag_popup = true;
    this.keep_unassign_tag_popup = true;
    this.show_unassign_tag_message = false;
    
    Promise.resolve().then(() => {
      const popup = this.template.querySelector(".unassign_tag_popup");
      if(popup){
        this.position_popup(popup);
      }
    });
    
    this.selected_account_id = "";
    this.selected_account_name = "";
    this.selected_tag_id = "";
    this.selected_tag_name = "";
    this.selected_tag_color = "";
    aura_show_tag_to_be_unassign({
      account_id: account_id,
      tag_id: tag_id
    }).then(async apex_result => {
      this.selected_account_id = "";
      this.selected_account_name = "";
      this.selected_tag_id = "";
      this.selected_tag_name = "";
      this.selected_tag_color = "";
      if(apex_result.account_id){
        this.selected_account_id = apex_result.account_id;
      }
      if(apex_result.account_name){
        this.selected_account_name = apex_result.account_name;
      }
      if(apex_result.tag_id){
        this.selected_tag_id = apex_result.tag_id;
      }
      if(apex_result.tag_name){
        this.selected_tag_name = apex_result.tag_name;
      }
      if(apex_result.tag_color){
        this.selected_tag_color = apex_result.tag_color;
      }
    }).catch(error => {
      console.error("JS Error 005", error);
    });
  }
  unassign_tag_popup_onclick_event(){
    this.show_unassign_tag_popup = true;
    this.keep_unassign_tag_popup = true;
  }
  button_close_unassign_tag_popup_onclick_event(event){
    event.stopPropagation();
    this.show_unassign_tag_popup = false;
  }
  unassign_tag_button_onmouseleave_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    tag_that_triggered_the_event.blur();
  }
  unassign_tag_button_onclick_event(){
    aura_unassign_tag({
      account_id: this.selected_account_id,
      tag_id: this.selected_tag_id,
    }).then(async apex_result => {
      switch(apex_result){
        case "Unassign complete.":
          this.selected_account_id = "";
          this.selected_account_name = "";
          this.selected_tag_id = "";
          this.selected_tag_name = "";
          this.selected_tag_color = "";
          this.show_unassign_tag_popup = false;
          this.show_accounts(false);
        break;
        case "The specified account and tag pair was not found in the database.":
          this.show_unassign_tag_message = true;
          this.unassign_tag_message = apex_result;
          this.show_accounts(false);
        break;
        default:
          this.show_unassign_tag_message = true;
          this.unassign_tag_message = apex_result;
        break;
      }
    }).catch(error => {
      console.error("JS Error 006", error);
    });
  }
  cancel_unassign_tag_button_onmouseleave_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    tag_that_triggered_the_event.blur();
  }
  cancel_unassign_tag_button_onclick_event(event){
    event.stopPropagation();
    const tag_that_triggered_the_event = event.currentTarget;
    tag_that_triggered_the_event.blur();
    this.show_unassign_tag_popup = false;
  }
  
  //Popup - New Tag
  new_tag_button_onclick_event(){
    this.show_new_tag_popup = true;
    this.keep_new_tag_popup = true;
    this.show_new_tag_message = false;
    
    Promise.resolve().then(() => {
      const popup = this.template.querySelector(".new_tag_popup");
      if(popup){
        const tag_name_input = this.template.querySelector(".tag_name_input");
        tag_name_input.value = this.tag_name;
        
        const tag_color_select = this.template.querySelector(".tag_color_select");
        tag_color_select.value = this.tag_color;
        
        this.position_popup(popup);
      }
    });
  }
  new_tag_popup_onclick_event(){
    this.show_new_tag_popup = true;
    this.keep_new_tag_popup = true;
  }
  button_close_new_tag_popup_onclick_event(event){
    event.stopPropagation();
    this.show_new_tag_popup = false;
  }
  tag_name_oninput_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    this.tag_name = tag_that_triggered_the_event.value;
    this.show_preview_tag = false;
    if(this.tag_name !== "" && this.tag_color !== ""){
      this.show_preview_tag = true;
    }
  }
  tag_color_onchange_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    this.tag_color = tag_that_triggered_the_event.value;
    this.show_preview_tag = false;
    if(this.tag_name !== "" && this.tag_color !== ""){
      this.show_preview_tag = true;
    }
  }
  add_tag_button_onmouseleave_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    tag_that_triggered_the_event.blur();
  }
  add_tag_button_onclick_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    tag_that_triggered_the_event.blur();
    
    aura_add_new_tag({
      tag_name: this.tag_name,
      tag_color: this.tag_color
    }).then(async apex_result => {
      switch(apex_result){
        case "Registration complete.":
          this.show_new_tag_popup = false;
          this.tag_name = "";
          this.tag_color = "";
          this.show_preview_tag = false;
          this.show_tags();
        break;
        case "The tag was not registered because a tag with this name already exists.":
          this.show_new_tag_message = true;
          this.new_tag_message = apex_result;
          this.show_tags();
        break;
        default:
          this.show_new_tag_message = true;
          this.new_tag_message = apex_result;
        break;
      }
    }).catch(error => {
      console.error("JS Error 007", error);
    });
  }
  
  //Popup - Delete Tag
  show_delete_tag_popup_onclick_event(event){
    const tag_id = event.currentTarget.dataset.tag_id;
    
    this.show_delete_tag_popup = true;
    this.keep_delete_tag_popup = true;
    this.show_delete_tag_message = false;
    
    Promise.resolve().then(() => {
      const popup = this.template.querySelector(".delete_tag_popup");
      if(popup){
        this.position_popup(popup);
      }
    });
    
    this.selected_tag_id = "";
    this.selected_tag_name = "";
    this.selected_tag_color = "";
    aura_show_tag_to_be_deleted({
      tag_id: tag_id
    }).then(async apex_result => {
      this.selected_tag_id = "";
      this.selected_tag_name = "";
      this.selected_tag_color = "";
      if(apex_result.tag_id){
        this.selected_tag_id = apex_result.tag_id;
      }
      if(apex_result.tag_name){
        this.selected_tag_name = apex_result.tag_name;
      }
      if(apex_result.tag_color){
        this.selected_tag_color = apex_result.tag_color;
      }
    }).catch(error => {
      console.error("JS Error 008", error);
    });
  }
  delete_tag_popup_onclick_event(){
    this.show_delete_tag_popup = true;
    this.keep_delete_tag_popup = true;
  }
  button_close_delete_tag_popup_onclick_event(event){
    event.stopPropagation();
    this.show_delete_tag_popup = false;
  }
  delete_tag_button_onmouseleave_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    tag_that_triggered_the_event.blur();
  }
  delete_tag_button_onclick_event(){
    aura_delete_tag({
      tag_id: this.selected_tag_id,
    }).then(async apex_result => {
      switch(apex_result){
        case "Deletion complete.":
          this.selected_tag_id = "";
          this.selected_tag_name = "";
          this.selected_tag_color = "";
          this.show_delete_tag_popup = false;
          this.show_tags();
        break;
        case "The specified tag was not found in the database.":
          this.show_delete_tag_message = true;
          this.delete_tag_message = apex_result;
          this.show_tags();
        break;
        default:
          this.show_delete_tag_message = true;
          this.delete_tag_message = apex_result;
        break;
      }
    }).catch(error => {
      console.error("JS Error 009", error);
    });
  }
  cancel_delete_tag_button_onmouseleave_event(event){
    const tag_that_triggered_the_event = event.currentTarget;
    tag_that_triggered_the_event.blur();
  }
  cancel_delete_tag_button_onclick_event(event){
    event.stopPropagation();
    const tag_that_triggered_the_event = event.currentTarget;
    tag_that_triggered_the_event.blur();
    this.show_delete_tag_popup = false;
  }
  
}
