# Pie Chart with Percentages
# By Le Chen.
# install.packages("plotrix")
library(plotrix)

if3d = 0 
# if3d = 1 

# Here input the weights:
Input <- ("
Item       , Weight
Homework   , 20
Attendance , 5
Test I     , 15
Test II    , 15
Test III   , 15
Final exam , 30
")

Data = read.table(textConnection(Input),
	sep = ",",
	header=TRUE)

items <- Data[,1]
weights <- Data[,2]

# weights <- c(20,20,20,20,20)
# items <- c("Quizzes", "Homework", "Midterm one", "Midterm two", "Final exam")

pct <- round(weights/sum(weights)*100)
items <- paste(items,"\n") # add newline 
items <- paste(items, pct) # add percents to labels
items <- paste(items,"%",sep="") # ad % to labels

if (if3d==1) {
	# png images are saved here:
	filename="./vimwiki_html/pichart3D.png"
	png(filename)
	pie3D(weights,labels = items, col=rainbow(length(items)),
		# start=10,
		radius=0.9,
		explode=0.1,
		labelcex=1.5,
		main="") 
	dev.off()
	print(paste(filename, " is in the vimwiki_html folder"))
	system(paste("convert ", filename, " -trim ", filename))
	system(paste("convert ", filename, " -scale 80%", filename))
}else{
	# png images are saved here:
	filename="./vimwiki_html/pichart2D.png"
	png(filename)
	pie(weights,labels = items, col=rainbow(length(items)),
		# start=10,
		# radius=0.9,
		# explode=0.1,
		cex=2,
		main="") 
	dev.off()
	print(paste(filename, " is in the vimwiki_html folder"))
	system(paste("convert ", filename, " -trim ", filename))
	system(paste("convert ", filename, " -scale 50%", filename))
}


