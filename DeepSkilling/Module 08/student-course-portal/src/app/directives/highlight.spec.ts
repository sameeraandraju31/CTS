import { ElementRef } from '@angular/core';
import { HighlightDirective } from './highlight';

describe('HighlightDirective', () => {

  it('should create an instance', () => {

    const elementRef = new ElementRef(document.createElement('div'));

    const directive = new HighlightDirective(elementRef);

    expect(directive).toBeTruthy();

  });

});