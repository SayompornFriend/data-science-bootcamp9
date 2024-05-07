##Chat bot to order pizza
orders <- function(){
  print ("Hello! welcome to pizza restaurant🍕")
  flush.console()
  customer_name <- readline("What your name : ")
  print (paste("Hello " , customer_name) )
  ## price
  order_price <-0
  total_price <- 0

  ##Create pizza menu
  df_pizza <- data.frame(
    id = (1:5),
    menus = c("Pepperoni","Cheese","Hawaiian","Margherita","Meat Lover"),
    price = c(100,150,200,250,300)
  )
  ##Create size pizza
  df_size_pizza <- data.frame(
    id = (1:3),
    size = c("small","mediam","Large"),
    price_size = c(0,100,150)
  )
  data_list <- list()

  ##Ask customer to buy some pizza
  flush.console()
    customer_decision <- readline("Would you like to order a pizza today?(y/n) : ")

      if (customer_decision == "Y" || customer_decision == "y" ){
        print("This our pizza🍕 menu")
        print(df_pizza)
        print("-----------------------------------------------")
        print("Size of pizza🍕")
        print(df_size_pizza)
        print("Mediam size +100 and Large size +150")

        # Loop to get customer input
        flush.console()
        while (TRUE){
          customer_order <- as.numeric(readline("What pizza you do want(Type 1-5) : "))
          size_pizza <- as.numeric(readline("What size pizza you want(Type 1-3) : "))
          order_qyt <- as.numeric(readline("How many your do want(Type Number) : "))

          ## show order pizza of customer
          flush.console()
          print("🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕")
          print(paste("Your order is : ",df_pizza$menu[[customer_order]]))
          print(paste("Size of pizza : ",df_size_pizza$size[[size_pizza]]))
          print(paste("Quantity : ",order_qyt))

          data_list[[length(data_list) + 1]] <- list(df_pizza$menu[[customer_order]], df_size_pizza$size[[size_pizza]], order_qyt)  # Add sub-list to list

          order_price = (df_pizza$price[[customer_order]] + df_size_pizza$price_size[[size_pizza]]) * order_qyt
          total_price = total_price + order_price
          print(paste("This order price is : ",order_price))
          print(paste("Total price is : ",total_price))

          flush.console()
          order_next <- readline("Would you like to order more (y/n) :")
          if (order_next == "N" || order_next == "n") {
            print("thank you very much for order our pizza")
          break
          }
        }
        # Combine rows into a DataFrame with column names
        df <- do.call(rbind, data_list)
        colnames(df) <- c("Menu", "Size","Quantity")
        #Order summary
        print("----------------------------------------")
        print(df)

        print("----------------------------------------")
        print(paste("All price include TAX 7% is : ",total_price *1.07 ))
        print("Have a great day! we hope to see you soon")
      } else if (customer_decision == "N" || customer_decision == "n"){
        print("Have a great day! we hope to see you soon")
      }
}
orders()
