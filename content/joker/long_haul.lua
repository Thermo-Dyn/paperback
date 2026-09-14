SMODS.Joker {
  key = "long_haul",
  config = {
    extra = {
      tags = 2,
    }
  },
  attributes = {
    'tag',
    'ticket',
    'minor_arcana'
  },
  rarity = 2,
  pos = { x = 20, y = 13 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback = {
    requires_tickets = true,
  },

  paperback_credit = {
    coder = { 'dowfrin' }
  },


  in_pool = function(self, args)
    if G.consumeables then
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability.set == 'paperback_ticket_to_ride' then
          return true
        end
      end
      return false
    end
  end,

  -- TODO: unlock requirement
  -- check_for_unlock = function(self, args)
  unlocked = true,
  -- end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.tags
      }
    }
  end,

  calculate = function(self, card, context)
    if context.paperback and context.paperback.ticket_progress then
      for i = 1, card.ability.extra.tags do
        PB_UTIL.add_tag('tag_paperback_divination', nil, i < card.ability.extra.tags)
      end
      return nil, true
    end
  end,
}
