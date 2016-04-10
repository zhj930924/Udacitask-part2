# What you added to Udacitask 2.0
---
### 1. What is the gem of your choice and how did you use it?
I chose terminal-table and adjective_animal gems. Originally I also chose arkiiart trying to convert a cat picture to arkiiart but I couldn't figure out how to correctly install that gem on my windows system. I know virtual machine is one way to go but it's very slow for some reason.

For usage I used terminal-table for formatting my todo list and adjective_animal to generate random animal objects (with occasionally funny and unexpected names).

### 2. Describe the 2 features you added to the project.
  * #### <p>a) Advanced deletion feature
My method names are actually very self explanatory. For this feature I only modified the original delete method added one new method delete_all, which clears the items array.</p>
<p>For the modified delete method I added polymorphism. Basically the method can now take in any number of arguments up to the length of the items list. The method will delete the item at a specified index for one argument; delete a range of items for two arguments (starting and ending index); delete multiple items at specified indices for three or more arguments; and throw an error if the number of arguments exceeds the length of the items array.</p>
  * #### b) Animal feature
  <p>This feature has five main methods and their supporting methods.</p>
  <p>summon_animals - takes one argument number of animals you want to summon. It randomly summons animals (try for yourself) from animal kingdom and their names will appear on your todo-list with high priorities.</p>
  <p>show_animals - list all the animals created by their names.</p>
  <p>feed_animals - buy food for all the animals created and feed them - priority is high</p>
  <p>dothingsfor_animals - takes one argument action as string. The action will be done for all the animals created.</p>
  <p>animal_kingdom - Throw a party with the with the animals created - starts tonight and lasts for 24 hours</p>

---
# REFLECTIONS
---
### 1. How long did you spend working on this project?
About 20 hours total with most of time doing research and trying to figure out what I did wrong.

### 2. What was the most rewarding challenge you conquered?
<p>I've encountered several challenges, and one of them is still not resolved.
First, 1 hour into the project, I stuck on how to call method on optional hash. After asking around and online research I figured out that I used options{ } to select instead of options[ ]. Also, I have to mention that I moved on to the next part and left the format_date method not refactored, and came back to it later.</p>

<p>Second, I was stuck on trying to install asciiart on my win 10 64x system. I tried like 10 different online tutorials and none of them worked. I asked on slack and haven't gotten any reply yet (It's been 30 hours). I ended up not using asciiart gem because I couldn't get its dependency gem rmagick to work (I tried installing different versions of Image Magick as well.) I wish someone can figure out or at least throw a warning to windows users before they try to use arkiiart gem on their project, so they don't have to waste time.</p>
<p>Finally, I spent several hours on figuring out how to get polymorphism to work for my delete method. Tried several different enumerable methods and solved the problem.

### 3. What two additional features did you build? Why?
My original plan was to inherit the pet feature from Udacitask one and draw some animal pictures with askiiart but since I couldn't install the gem I gave up.

Otherwise my new features are animal and advanced deletion. The animal feature is like a compromise - I was not able to do the pet feature again but I wish to add something fun. The advanced deletion was recommended from the project preparation page.
### 4. Where do you still have room to grow?
I have a lot of room to grow. Still, I need to work on my loops, and also use the newly acquired skills more often. I also need to increase my class and module usage.
