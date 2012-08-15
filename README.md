Lonely Planet Recruitment Coding Exercise
=========================================

We are trying to find accommodation matches for people who want to go on holiday. There are two sets of data: travellers.json and accommodation.json

Travellers
----------

`data/travellers.json` contains people, their desired price range for accommodation, and their requirements

    [
      {
        "id": 12345,
        "name": "Julian Doherty",
        "priceRange": {"min": 120, "max": 150}},
        "requirements": ["internet", "bath"],
      },
      ...
    ]
    
Accommodation
------------
    
`data/accommodation.json` contains a list of accommodation locations, price rate, attributes, and total/available capacity

    [
      {
        "id": 4321,
        "name": "Hotel Awesome",
        "price": 130,
        "attributes": [
          "close to transport", "internet", "bath"
        ],
        "capacity": {"total": 25, "free": 12}
      }
    ]

Requirements
------------

Write an application(s) that reads in both accommodation and traveller data files, and process as follows

  * for each traveller in the order they appear in the input file
    1. find the one accommodation location that:
      * is the cheapest within the traveller's price range
      * has **all** the traveller's requirements in the accommodation's attributes
      * has free capacity
    2. add the traveller to the list of bookings for the accommodation
    3. adjust the free capacity for the accommodation
  * iterate to next traveller

Once the data is loaded and processed, query the processed data in the following ways
  
  * list the travellers booked at an accommodation by accommodation id
  * show the accommodation (or none) where a traveller is booked by traveller id
  * given a price and requirements, find the best accommodation match name and price (or none) for a new traveller

This code is to be driven via a command line application. e.g:
        
    $~> bin/lpbooker accommodation travellers.json accomodation.json 4321
    Accommodation: Hotel Awesome
    ---
    Julian Doherty
    Homer Simpson
    
    
    $~> bin/lpbooker traveller travellers.json accomodation.json 12345
    Traveller: Julian Doherty
    Booked at: Hotel Awesome
    
    
    $~> bin/lpbooker search travellers.json accomodation.json 120 150 internet bath, "close to transport"
    Hotel Awesome, 130
    
    
A Ruby stub command line app is living in the `bin` directory. Feel free to use this, or re-implement if desired. If you're working in another language, you're on your own to implement this :)

Note, the command line API displayed here is a guide - feel free to rework use whatever makes sense in your application.

Submitting
----------
Create a tar.gz of your application (including data files so it can be run standalone), and mail it back to your Lonely Planet contact.

Marking Criteria
----------------
Here's what the Lonely Planet dev team is looking for when we review your app (among other things...)

- You actually know how to program
- Cleanly structured code
- Easy to follow
- Open to allowing further enhancements
- Elegant and simple. Not over engineered beyond what is required
- Algorithm/data structure usage - how would this perform with 10,000s of accommodation locations, and 1,000,000s of travellers? Both in terms of processing time and memory usage
- Tests/specs for code
- Clear instructions on how to execute your application
- Appropriate use of gem/lib frameworks to manage dependencies (if any) e.g. bundler, rvm
- Actually runs and gives correct answers :)
- Including a git repo with your app is nice, as we can see what you were thinking and how your worked on your solution
- Can be implemented in any language that can be run on OSX and/or Linux. Note that we use Ruby and Java mainly at LP. Feel free to use something else, but be sure to include instructions on how to get your app up and running (including installing runtimes/compilers etc) if you aren't using either of these.

Feel free to include a readme doc explaining your thoughts and assumptions on these issues if in doubt.