# Project Euler, Problem #54
# Lucas Garron
# Date: November 26, 2013

from __future__ import print_function
from collections import Counter

MATCH = 100


def value(s):
  return "--23456789TJQKA".index(s[0])

rounds = []
with open("input/54.txt") as f:
  for line in f:
    cards = line.strip().split(" ")
    rounds.append((cards[0:5], cards[5:10]))


def uples(hand, n):
  c = dict(Counter(map(value, hand)))
  return [k for k, v in c.items() if v == n]


def high_card(hand):
  return [max(map(value, hand))]


# The following definitions can be unified,
# but they differ from each other in small but annoying ways. :-/

def pair(hand):
  pairs = uples(hand, 2)
  if len(pairs) == 1:
    return [pairs[0]]
  return None


def two_pairs(hand):
  pairs = uples(hand, 2)
  if len(pairs) == 2:
    return sorted(pairs, reverse=True)
  return None


def three_of_a_kind(hand):
  triples = uples(hand, 3)
  if len(triples) == 1:
    return [triples[0]]
  return None


def straight(hand):
  values = set(map(value, hand))
  for i in range(10, 1, -1):
    straight_values = set(range(i, i + 5))
    # print(straight_values)
    # print(values)
    if straight_values <= values:
      return [i]
  return None


def flush(hand):
  suits = map(lambda x: x[1], hand)
  c = dict(Counter(suits))
  suit_flushes = [k for k, v in c.items() if v == 5]
  if len(suit_flushes) == 1:
    return [MATCH]
  return None


def full_house(hand):
  triples = uples(hand, 3)
  pairs = uples(hand, 2)
  if len(triples) == 1 and len(pairs) == 1:
    return [triples[0], pairs[0]]
  return None


def four_of_a_kind(hand):
  triples = uples(hand, 4)
  if len(triples) == 1:
    return [triples[0]]
  return None


def straight_flush(hand):
  s = straight(hand)
  f = flush(hand)
  # print(s, f)
  if s and f:
    return s
  return None


def royal_flush(hand):
  s = straight(hand)
  f = flush(hand)
  # print(s, f)
  if s and (s[0] == 10) and f:
    return s
  return None


functions = [
  high_card,
  pair,
  two_pairs,
  three_of_a_kind,
  straight,
  flush,
  full_house,
  four_of_a_kind,
  straight_flush,
  royal_flush
]


def rank_hand(hand):
  for i in reversed(range(len(functions))):
    result = functions[i](hand)
    if result:
      values = sorted(map(value, hand), reverse=True)
      # Type, special tie-breakers, boring tie-breakers.
      return [i] + result + values
  assert False


def winner(hands):
  for h1, h2 in zip(*map(rank_hand, hands)):
    if h1 > h2:
      return 1
    if h2 > h1:
      return 2
  assert False


winners = [winner(hands) for hands in rounds]
print(winners.count(1))
