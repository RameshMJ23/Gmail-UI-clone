import 'dart:io';

import 'package:flutter/animation.dart';
import 'package:gmailclone/model/attach_file.dart';
import 'package:gmailclone/model/mail_model.dart';
import 'package:gmailclone/model/sender_info_model.dart';
import 'package:flutter/material.dart';

List<MailModel> account1_mail_data = [
  MailModel(
      senderInfo: SenderInfo(
        senderMail: "english-personalized-digest@quora.com",
        senderName: "Quora Digest",
        senderProfilePic: null,
        profileColor: Colors.orange
      ),
      title: "I’m a mediocre software engineer. Can I be successful in companies like Facebook, Google, Uber etc? I prepared like",
      content:  """Quora RAMESH's Digest ,I’m a mediocre software engineer. Can I be successful in companies like Facebook, Google, Uber etc? I prepared like hell for 6 months, and got an offer from one of them. I fear I got the offer because of my preparation and I’ll fail on the job.
    Timothy Johnson, former Software Engineering Intern at Google (2017) • Answered November 11, 2019 A friend of mine graduated from a coding bootcamp and joined Google a few months ago. """ ,
      attachedFile: AttachedFile(isAttached: false, fileName: null, fileType:  null),
      starred: false,
      isSeen: false,
      dateTime: DateTime(2021, 12, 5, 10,11),
    isSelected: false
  ),
  MailModel(
      senderInfo: SenderInfo(
        senderMail: "jobs-noreply@linkedin.com",
        senderName: "LinkedIn",
        senderProfilePic: null,
        profileColor: Colors.orange
      ),
      title: "New jobs similar to Junior Developer at DreamCubator",
      content:  """ Check out jobs like Junior Developer """ ,
      attachedFile: AttachedFile(isAttached: false, fileName: null, fileType:  null),
      starred: false,
      isSeen: false,
      dateTime: DateTime(2021, 12, 5, 10,11),
      isSelected: false
  ),
  MailModel(
      senderInfo: SenderInfo(
        senderMail: "careerboost@academy.greatlearning.in",
        senderName: "CareerSchool by Great Learning",
        senderProfilePic: null,
        profileColor: Colors.purpleAccent
      ),
      title: "Start your successful career as a Python Software Engineer",
      content:  """Dear Learner,
      
      Unlock your full potential and learn from the best prep content, LIVE sessions and apply to the premium jobs, available especially to CareerSchool Learners. """ ,
      attachedFile: AttachedFile(isAttached: false, fileName: null, fileType:  null),
      starred: false,
      isSeen: false,
      dateTime: DateTime(2021, 12, 5, 10,11),
      isSelected: false
  ),
  MailModel(
      senderInfo: SenderInfo(
        senderMail: "krish@yahoo.com",
        senderName: "Krish",
        senderProfilePic: null,
          profileColor: Colors.green
      ),
      title: "Work",
      content:  """
Complete the work attached with this week.

- Thank you
      """ ,
      attachedFile: AttachedFile(isAttached: true, fileName: "work.xlsx", fileType: FileType.excel),
      starred: true,
      isSeen: false,
      dateTime: DateTime(2021, 12, 5, 10,11),
      isSelected: false
  ),
  MailModel(
      senderInfo: SenderInfo(
        senderMail: "abbc@info.com",
        senderName: "abbc corp",
        senderProfilePic: null,
        profileColor: Colors.blue
      ),
      title: "Information",
      content:  """ 
We have attached the information we wanted to convey you kindly check it


- Thank you
      """ ,
      attachedFile: AttachedFile(isAttached: true, fileName: "Information.doc", fileType: FileType.word),
      starred: false,
      isSeen: true,
      dateTime: DateTime(2021, 12, 5, 10,11),
      isSelected: false
  ),
  MailModel(
      senderInfo: SenderInfo(
        senderMail: "no-reply@spotify.com",
        senderName: "Spotify",
        senderProfilePic: null,
          profileColor: Colors.lime
      ),
      title: "Get 3 free months of ad-free music listening",
      content:  """ Get 3 free months of ad-free music listening. Keep the vibe going with premium.. """ ,
      attachedFile: AttachedFile(isAttached: false, fileName: null, fileType:  null),
      starred: false,
      isSeen: false,
      dateTime: DateTime(2021, 12, 5, 10,11),
      isSelected: false
  ),
  MailModel(
      senderInfo: SenderInfo(
        senderMail: "system@hr-on.com",
        senderName: "Trackunit",
        senderProfilePic: null,
          profileColor: Colors.orange
      ),
      title: "Dear candidate",
      content:  """We are sending you this mail because you have applied for a position at Trackunit within the last couple of months. We would like to keep your information in our CV database and reach out in the future if a opening is avaiable. And for that, we need your consent.

In regards to GDPR regulations, we would like to obtain the following consent to store your information from you - click on the link and accept if you dont mind us saving your information. If you do not agree to our Terms within 14 days, your data will be deleted. 

Link to consent

Kind regards,

Hanne Foldbjerg
HR Partner """ ,
      attachedFile: AttachedFile(isAttached: false, fileName: null, fileType:  null),
      starred: false,
      isSeen: false,
      dateTime: DateTime(2021, 12, 5, 10,11),
      isSelected: false
  ),
  MailModel(
      senderInfo: SenderInfo(
        senderMail: "english-personalized-digest@quora.com",
        senderName: "Quora Digest",
        senderProfilePic: null,
          profileColor: Colors.red
      ),
      title: "I’m a mediocre software engineer. Can I be successful in companies like Facebook, Google, Uber etc? I prepared like",
      content:  """Quora RAMESH's Digest ,I’m a mediocre software engineer. Can I be successful in companies like Facebook, Google, Uber etc? I prepared like hell for 6 months, and got an offer from one of them. I fear I got the offer because of my preparation and I’ll fail on the job.
    Timothy Johnson, former Software Engineering Intern at Google (2017) • Answered November 11, 2019 A friend of mine graduated from a coding bootcamp and joined Google a few months ago. """ ,
      attachedFile: AttachedFile(isAttached: false, fileName: null, fileType:  null),
      starred: false,
      isSeen: false,
      dateTime: DateTime(2021, 12, 5, 10,11),
      isSelected: false
  ),
  MailModel(
      senderInfo: SenderInfo(
        senderMail: "english-personalized-digest@quora.com",
        senderName: "Quora Digest",
        senderProfilePic: null,
          profileColor: Colors.pink
      ),
      title: "What's the cost of living in Germany? Can one survive with 2500 euros per month there?",
      content:  """An income of 2500 Euros a month would be what someone who earns 60,000 a year has left over after taxes, social deductions, and additional insurances. Deductions are pretty...""" ,
      attachedFile: AttachedFile(isAttached: false, fileName: null, fileType:  null),
      starred: false,
      isSeen: false,
      dateTime: DateTime(2021, 12, 5, 10,11),
      isSelected: false
  ),
  MailModel(
      senderInfo: SenderInfo(
        senderMail: "english-personalized-digest@quora.com",
        senderName: "Quora Digest",
        senderProfilePic: null,
          profileColor: Colors.pinkAccent
      ),
      title: "I’m a mediocre software engineer. Can I be successful in companies like Facebook, Google, Uber etc? I prepared like",
      content:  """Quora RAMESH's Digest ,I’m a mediocre software engineer. Can I be successful in companies like Facebook, Google, Uber etc? I prepared like hell for 6 months, and got an offer from one of them. I fear I got the offer because of my preparation and I’ll fail on the job.
    Timothy Johnson, former Software Engineering Intern at Google (2017) • Answered November 11, 2019 A friend of mine graduated from a coding bootcamp and joined Google a few months ago. """ ,
      attachedFile: AttachedFile(isAttached: false, fileName: null, fileType:  null),
      starred: false,
      isSeen: false,
      dateTime: DateTime(2021, 12, 5, 10,11),
      isSelected: false
  ),
  MailModel(
      senderInfo: SenderInfo(
        senderMail: "english-personalized-digest@quora.com",
        senderName: "Quora Digest",
        senderProfilePic: null,
          profileColor: Colors.redAccent
      ),
      title: "Which European country do you think is most desirable to live in and why?",
      content:  """ It depends on your situation and what you are looking for. 1. If you are going to retire or work from a distance or using the internet (like I do). """ ,
      attachedFile: AttachedFile(isAttached: false, fileName: null, fileType:  null),
      starred: false,
      isSeen: false,
      dateTime: DateTime(2021, 12, 5, 10,11),
      isSelected: false
  ),
  MailModel(
      senderInfo: SenderInfo(
        senderMail: "english-personalized-digest@quora.com",
        senderName: "Quora Digest",
        senderProfilePic: null,
          profileColor: Colors.deepPurpleAccent
      ),
      title: "What sort of pressure do Google employees face?",
      content:  """I left Google in 2014, so this answer may be out of date. There are three sorts of pressures I saw placed on engineers.
For new employees, especially those below a Sr. SWE l... """ ,
      attachedFile: AttachedFile(isAttached: false, fileName: null, fileType:  null),
      starred: true,
      isSeen: true,
      dateTime: DateTime(2021, 12, 5, 10,11),
      isSelected: false
  ),
];