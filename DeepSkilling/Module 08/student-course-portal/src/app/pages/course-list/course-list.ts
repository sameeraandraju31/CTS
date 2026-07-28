import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Observable } from 'rxjs';

import { Store } from '@ngrx/store';

import { CourseCard } from '../../components/course-card/course-card';

import * as CourseActions from '../../store/course/course.actions';
import { selectAllCourses } from '../../store/course/course.selectors';

@Component({
  selector: 'app-course-list',
  standalone: true,
  imports: [CommonModule, CourseCard],
  templateUrl: './course-list.html',
  styleUrl: './course-list.css'
})
export class CourseList implements OnInit {

  courses$!: Observable<any[]>;

  selectedCourseId = 0;

  constructor(private store: Store) {}

  ngOnInit(): void {

    this.courses$ = this.store.select(selectAllCourses);

    this.store.dispatch(CourseActions.loadCourses());

  }

  onEnroll(courseId: number) {
    console.log('Enrolling in course:', courseId);
    this.selectedCourseId = courseId;
  }

  trackByCourseId(index: number, course: any) {
    return course.id;
  }

}