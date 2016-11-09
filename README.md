# Tutor's helper

Tutor's helper is a full stack web platform for personal tutors to coordinate classes with their students. It's designed to take the chore out of payment management, class bookings, giving feedback and more. A lightweight forum is also included for students to interact with one another.

In short, Tutor's helper is a CRM for personal tutors.

Note: This is version 0.1 and many aspects have not yet been tested for reliability. Use in an actual tutor-student setting is discouraged for now.

(screenshots)

## Features

Here's the current list of stable features:
* Calendar to view, add and edit classes, and to set unavailable dates
* An overview page for a quick glance of things to do (finances to come)
* Forum for students and tutor to post questions and discuss
* Give feedback to student after every class

## Technology stack

As of version 0.1, Tutor's helper is built on Ruby on Rails and Postgres DB, with Semantic UI as the chosen front-end library.

## Development process

This was my final General Assembly project. In the span of a week we were tasked to build a project that would be the culmination of what we've learned over the 3 month course.

I chose to build this because it required knowledge of several tech/topics that I felt were valuable as a fledgling web developer:
* Setting up Rails model-view-controller
* Making AJAX calls in Rails to improve UX by reducing browser refreshes
* Using Rails gems like [Simple_Calendar](https://github.com/excid3/simple_calendar) and [Devise](https://github.com/plataformatec/devise) (authentication)
* Writing embedded Ruby using [Haml](https://github.com/haml/haml), a superior templating language (IMHO) to .erb
* Integrating Rails with a front-end library like Semantic UI
* Tying the pieces together in Rails to build a full stack web app

Technically speaking, this isn't pushing the limits of sophistication. The point, for me at least, wasn't to make use of _all_ the things I've learned. It was to challenge myself to build something interesting, potentially useful, and more importantly, to push myself to build something that _someone would actually use_.

The goal was to build a solid foundation for the project, and then build some more on top of that afterwards. I didn't want to have to overhaul the project when I came back to it because of spaghetti code and bad database architecture. I'm glad to report that I don't feel stressed out looking at the code at the moment. Fingers crossed!
