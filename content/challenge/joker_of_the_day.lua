SMODS.Challenge {
  key = 'joker_of_the_day',
  rules = {
    modifiers = {

    }
  },
  jokers = {
    { id = "j_paperback_photocopy", eternal = true }, { id = "j_paperback_master_plan", eternal = true }, { id = "j_brainstorm", eternal = true }, { id = "j_blueprint", eternal = true },

  },
  restrictions = {
    banned_cards = {
      { id = 'j_paperback_shadowmantle' },
      { id = 'j_paperback_book_of_vengeance' },
      { id = 'j_invisible' },
      { id = 'c_paperback_eight_of_wands' },
      { id = 'c_paperback_nine_of_swords' },
      { id = 'c_paperback_two_of_pentacles' },
      { id = 'v_blank' },
      { id = 'v_antimatter' }
    },
    banned_other = {
      { id = 'tag_negative', type = 'tag' },
      { id = 'bl_final_leaf', type = 'blind' },
    },
  }
}
