# dna: genetic algorithm (GA)
**dna** provides the framework for a GA implementation in STATA. You have to specify a fitness function as parameter along with other hyper-parameters like radiation, mutation, offspring and population sizes to initiate the evolution. The algorithm converges when the population stagnates (no offspring can outperform the parents) for a given number of generations.
This is a very old module but should still work.

## Prerequisites
STATA

## Getting started
* Copy dna.ado and dna.hlp into your ADO file directory (typically c:\ado).
* Call the help file within STATA: help dna

## Literature
* Czarnitzki, Dirk und Thorsten Doherr (2002), Genetic Algorithms: A Tool for Optimization in Econometrics – Basic Concept and an Example for Empirical Applications, ZEW Discussion Paper No. 02-41, Mannheim.

### Author
* **Thorsten Doherr** - [ZEW](https://www.zew.de/en/team/tdo/)
