//
//  OnboardingQuestions.swift
//  Fetch
//
//  Created by yi.hao on 3/19/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation

enum OnboardingQuestions {

    static func load() -> OnboardingSequence {
        let section1 = OnboardingSection(
            title: "The Basics",
            questions: [
                OnboardingQuestion(
                    title: "I'm looking for a",
                    questionType: .multipleChoice,
                    choices: ["Dog",
                              "Cat"],
                    hint: "SELECT ALL THAT APPLY"),
                OnboardingQuestion(
                    title: "My zip code is",
                    minInputLength: 5,
                    maxInputLength: 5,
                    placeHolderText: "Enter your zip code here",
                    inputKeyboardType: .digit)])
        let section2 = OnboardingSection(
            title: "Tell Us About Yourself",
            questions: [
                OnboardingQuestion(
                    title: "When it comes to taking care of pets, I’m",
                    questionType: .singleChoice,
                    choices: ["An Expert",
                              "Experienced",
                              "A Novice"]),
                OnboardingQuestion(
                    title: "I’m looking for a pet that’s",
                    questionType: .multipleChoice,
                    choices: ["Small",
                              "Medium",
                              "Large"],
                    hint: "SELECT ALL THAT APPLY"),
                OnboardingQuestion(
                    title: "I’m looking for a pet that’s",
                    questionType: .multipleChoice,
                    choices: ["Male",
                              "Female"],
                    hint: "SELECT ALL THAT APPLY"),
                OnboardingQuestion(
                    title: "My pet must be good with",
                    questionType: .multipleChoice,
                    choices: ["Children",
                              "Dogs",
                              "Cats"],
                    hint: "SELECT ALL THAT APPLY")])
        let section3 = OnboardingSection(
            title: "Describe Your Dream Pet",
            questions: [
                OnboardingQuestion(
                    title: "I want a pet who is",
                    questionType: .multipleChoice,
                    choices: ["A Couch Potato",
                              "Active",
                              "An Athlete"],
                    hint: "SELECT ALL THAT APPLY"),
                OnboardingQuestion(
                    title: "I’d like my pet to be",
                    questionType: .multipleChoice,
                    choices: ["A Wallflower",
                              "Social",
                              "The Life Of The Party"],
                    hint: "SELECT ALL THAT APPLY"),
                OnboardingQuestion(
                    title: "During training, I’d like my pet to be a",
                    questionType: .multipleChoice,
                    choices: ["Class Clown",
                              "Attentive Student",
                              "Teacher’s Pet"],
                    hint: "SELECT ALL THAT APPLY"),
                OnboardingQuestion(
                    title: "I want my pet by my side",
                    questionType: .multipleChoice,
                    choices: ["Sometimes",
                              "Often",
                              "Constantly"],
                    hint: "SELECT ALL THAT APPLY")])
        let sequence = OnboardingSequence(
            sections: [section1, section2, section3])
        return sequence
    }

    static func loadOnlyZipCode() -> OnboardingSequence {
        let section =
            OnboardingSection(
                title: "MockSection",
                questions: [
                    OnboardingQuestion(
                        title: "My zip code is",
                        minInputLength: 5,
                        maxInputLength: 5,
                        placeHolderText: "Enter your zip code here",
                        inputKeyboardType: .digit)
        ])
        return OnboardingSequence(sections: [section])
    }
}
