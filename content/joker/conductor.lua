SMODS.Joker {
  key = "conductor",
  config = {
    extra = {
      a_mult = 10,
    }
  },
  attributes = {
    'mult',
    'ticket',
    'scaling',
  },
  rarity = 1,
  pos = { x = 16, y = 13 },
  atlas = "jokers_atlas",
  cost = 5,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_tickets = true
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

  check_for_unlock = function(self, args)
    if args.type == 'discover_amount' then
      for i, v in ipairs(PB_UTIL.ENABLED_TICKETS) do
        local key = 'c_paperback_' .. v .. "_highest"
        if PB_UTIL.get_profile_value(key, 0) == 3 then return true end
      end
    end
  end,

  loc_vars = function(self, info_queue, card)
    local count = 0
    if G.consumeables then
      for i, v in ipairs(G.consumeables.cards) do
        if v.ability.set == 'paperback_ticket_to_ride' then
          count = count + 1
        end
      end
    end

    return {
      vars = {
        card.ability.extra.a_mult,
        card.ability.extra.a_mult * count
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      local count = 0
      for i, v in ipairs(G.consumeables.cards) do
        if v.ability.set == 'paperback_ticket_to_ride' then
          count = count + 1
        end
      end
      return {
        mult = count * card.ability.extra.a_mult
      }
    end
  end
}
