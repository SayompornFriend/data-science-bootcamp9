##Create rock paper scissor game
game <- function () {
  print("Welcome to rock🔨 paper📃 scissor✂ game")
  flush.console()

  user_name <- readline("What your name :")
  print(paste("Hi! ",user_name," let play game together"))
  print("You can type rock,paper,scissor or 1,2,3 (1=rock,2=paper,3=scissor)")
  print("🔨📃✂🔨📃✂🔨📃✂🔨📃✂🔨📃✂")
  ## Score
  user_score <- 0
  bot_score <- 0

  ## Game function
  while (TRUE) {
    flush.console()
    bot_hand <- c("🔨","📃","✂")
    ran_bot_hand <- sample(bot_hand,1)
    user_hand <- readline("Chose your hand : ")

    if (ran_bot_hand == "🔨" & (user_hand == "paper" || user_hand == 2)) {
        print(paste("Bot hand is : ",ran_bot_hand))
        print("WIN")
        user_score = user_score + 1
        bot_score = bot_score + 0
    } else if (ran_bot_hand == "📃" & (user_hand ==  "paper" || user_hand == 2)) {
        print(paste("Bot hand is : ",ran_bot_hand))
        print("DRAW")
        user_score = user_score + 0
        bot_score = bot_score + 0
    } else if (ran_bot_hand == "✂" & (user_hand == "paper" || user_hand == 2)) {
        print(paste("Bot hand is : ",ran_bot_hand))
        print("LOSE")
        user_score = user_score + 0
        bot_score = bot_score + 1
    } else if (ran_bot_hand == "📃" & (user_hand == "scissor" || user_hand == 3)) {
        print(paste("Bot hand is : ",ran_bot_hand))
        print("WIN")
        user_score = user_score + 1
        bot_score = bot_score + 0
    } else if (ran_bot_hand == "✂" & (user_hand ==  "scissor" || user_hand == 3)) {
        print(paste("Bot hand is : ",ran_bot_hand))
        print("DRAW")
        user_score = user_score + 0
        bot_score = bot_score + 0
    } else if (ran_bot_hand == "🔨" & (user_hand == "scissor" || user_hand == 3)) {
        print(paste("Bot hand is : ",ran_bot_hand))
        print("LOSE")
        user_score = user_score + 0
        bot_score = bot_score + 1
    } else if (ran_bot_hand == "✂" & (user_hand == "rock" || user_hand == 1)) {
        print(paste("Bot hand is : ",ran_bot_hand))
        print("WIN")
        user_score = user_score + 1
        bot_score = bot_score + 0
    } else if (ran_bot_hand == "🔨" & (user_hand ==  "rock" || user_hand == 1)) {
        print(paste("Bot hand is : ",ran_bot_hand))
        print("DRAW")
        user_score = user_score + 0
        bot_score = bot_score + 0
    } else if (ran_bot_hand == "📃" & (user_hand == "rock" || user_hand == 1)) {
        print(paste("Bot hand is : ",ran_bot_hand))
        print("LOSE")
        user_score = user_score + 0
        bot_score = bot_score + 1
    } else { ## invalid input
      print("❗Invalid input plese type rock,paper,scissor")
    }
    ## Count score if somenoe has 3 score finish game
    if(user_score == 3){
      print("🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉")
      print(paste("Your score :" ,user_score))
      print(paste("Bot score :" ,bot_score))
      print("🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉")
      print("Congratulation YOU WIN!!!!")
      break
    } else if(bot_score == 3) {
      print("💥💥💥💥💥💥💥💥💥💥💥💥💥")
      print(paste("Your score :" ,user_score))
      print(paste("Bot score :" ,bot_score))
      print("💥💥💥💥💥💥💥💥💥💥💥💥💥")
      print("YOU LOSE!! try again ")
      break
    }

  }

  }

  game()
